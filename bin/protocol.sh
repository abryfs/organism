#!/bin/bash
# Organism protocol state tracker
# Tracks which coordination protocol steps have completed for the current task.
# Used by hooks to enforce step ordering — the agent can't skip to coding
# without Gut and Spine running first.
#
# Usage:
#   protocol.sh start "task description"   — Begin a new task, reset state
#   protocol.sh mark <step> [data]         — Mark a step as complete
#   protocol.sh check <step>               — Check if prerequisites for step are met
#   protocol.sh status                     — Show current protocol state
#   protocol.sh complete                   — Mark task done, clean up
#   protocol.sh skip                       — Skip protocol for non-code tasks (docs, config)
#
# Steps: gut-filter, brain-plan, spine-gate, hands-build, spine-verify, gut-reality, health-check

STATE_DIR="${ORGANISM_STATE_DIR:-/tmp/organism-protocol}"
STATE_FILE="$STATE_DIR/state.json"

mkdir -p "$STATE_DIR"

# Initialize empty state if none exists
if [ ! -f "$STATE_FILE" ]; then
    echo '{"active":false,"skipped":false,"task":"","steps":{}}' > "$STATE_FILE"
fi

case "${1:-status}" in

    start)
        TASK="${2:-unnamed task}"
        # Read default tier from config, allow per-task override as $3
        CONFIG_DIR="$HOME/.organism"
        DEFAULT_TIER="standard"
        if [ -f "$CONFIG_DIR/config.json" ]; then
            DEFAULT_TIER=$(python3 -c "import json; print(json.load(open('$CONFIG_DIR/config.json')).get('tier', 'standard'))" 2>/dev/null || echo "standard")
        fi
        TIER="${3:-$DEFAULT_TIER}"
        cat > "$STATE_FILE" <<EOF
{
  "active": true,
  "skipped": false,
  "task": "$TASK",
  "started": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "steps": {},
  "overrides": 0,
  "teammates": 0,
  "tier": "$TIER"
}
EOF
        echo "Protocol started: $TASK (tier: $TIER)"
        ;;

    skip)
        # For non-code tasks (docs, config, research) that don't need full protocol
        cat > "$STATE_FILE" <<EOF
{
  "active": true,
  "skipped": true,
  "task": "${2:-non-code task}",
  "started": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "steps": {},
  "overrides": 0,
  "teammates": 0,
  "tier": "quick"
}
EOF
        echo "Protocol skipped for non-code task"
        ;;

    mark)
        STEP="$2"
        shift 2
        DATA="${*:-done}"

        if [ -z "$STEP" ]; then
            echo "Usage: protocol.sh mark <step> [data]"
            exit 1
        fi

        # Update state with python (available on macOS)
        python3 -c "
import json
with open('$STATE_FILE', 'r') as f:
    state = json.load(f)
state['steps']['$STEP'] = {'completed': '$(date -u +%Y-%m-%dT%H:%M:%SZ)', 'data': '$DATA'}
with open('$STATE_FILE', 'w') as f:
    json.dump(state, f, indent=2)
    f.write('\n')
"
        echo "Marked: $STEP"
        ;;

    check)
        STEP="$2"

        # Read state
        ACTIVE=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('active', False))" 2>/dev/null)
        SKIPPED=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('skipped', False))" 2>/dev/null)

        # If protocol explicitly skipped (non-code task), allow everything
        if [ "$SKIPPED" = "True" ]; then
            exit 0
        fi

        # If protocol not active, block production code edits
        if [ "$ACTIVE" != "True" ]; then
            echo "{\"systemMessage\": \"PROTOCOL: No active protocol. Start with: protocol.sh start \\\"task description\\\" before editing production code.\"}"
            exit 2
        fi

        # Check prerequisites for each step
        has_step() {
            python3 -c "
import json
d = json.load(open('$STATE_FILE'))
print('yes' if '$1' in d.get('steps', {}) else 'no')
" 2>/dev/null
        }

        case "$STEP" in
            hands-build)
                # Hands can't build without Gut + Brain + Spine completing first
                GUT=$(has_step gut-filter)
                BRAIN=$(has_step brain-plan)
                SPINE=$(has_step spine-gate)

                MISSING=""
                if [ "$GUT" != "yes" ]; then MISSING="$MISSING Step 1 (Gut Filter):"; fi
                if [ "$BRAIN" != "yes" ]; then MISSING="$MISSING Step 2 (Brain Plan):"; fi
                if [ "$SPINE" != "yes" ]; then MISSING="$MISSING Step 3 (Spine Gate):"; fi

                if [ -n "$MISSING" ]; then
                    echo "{\"systemMessage\": \"PROTOCOL BLOCKED: Cannot edit code yet. Missing:$MISSING Run the coordination protocol in order. Use 'protocol.sh mark <step>' after completing each step, or 'protocol.sh skip' for non-code tasks.\"}"
                    exit 2
                fi
                ;;

            spine-verify)
                # Spine can't verify without Hands completing
                HANDS=$(has_step hands-build)
                if [ "$HANDS" != "yes" ]; then
                    echo "{\"systemMessage\": \"PROTOCOL: Spine Verify requires Hands Build to complete first.\"}"
                    exit 2
                fi
                ;;

            gut-reality)
                # Gut reality check requires Spine verify
                VERIFY=$(has_step spine-verify)
                if [ "$VERIFY" != "yes" ]; then
                    echo "{\"systemMessage\": \"PROTOCOL: Gut Reality Check requires Spine Verify to complete first.\"}"
                    exit 2
                fi
                ;;
        esac
        exit 0
        ;;

    status)
        if [ ! -f "$STATE_FILE" ]; then
            echo "No active protocol"
            exit 0
        fi
        python3 -c "
import json
d = json.load(open('$STATE_FILE'))
if not d.get('active'):
    print('No active protocol')
else:
    print(f\"Task: {d['task']}\")
    print(f\"Tier: {d.get('tier', 'quick')}\")
    print(f\"Teammates: {d.get('teammates', 0)}\")
    print(f\"Overrides: {d.get('overrides', 0)}\")
    steps = d.get('steps', {})
    order = ['gut-filter', 'brain-plan', 'spine-gate', 'hands-build', 'spine-verify', 'gut-reality', 'health-check']
    for s in order:
        status = '✓' if s in steps else '·'
        print(f'  {status} {s}')
"
        ;;

    complete)
        python3 -c "
import json
d = json.load(open('$STATE_FILE'))
d['active'] = False
d['completed'] = '$(date -u +%Y-%m-%dT%H:%M:%SZ)'
with open('$STATE_FILE', 'w') as f:
    json.dump(d, f, indent=2)
    f.write('\n')
"
        echo "Protocol complete"
        ;;

    teammate)
        # Log that a teammate was spawned
        ROLE="${2:-worker}"
        python3 -c "
import json
d = json.load(open('$STATE_FILE'))
d['teammates'] = d.get('teammates', 0) + 1
with open('$STATE_FILE', 'w') as f:
    json.dump(d, f, indent=2)
    f.write('\n')
print(f\"Teammate spawned: $ROLE ({d['teammates']} total)\")
"
        ;;

    check-teammates)
        # Check if teammates should have been spawned for Standard+ tier
        TIER=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('tier', 'quick'))" 2>/dev/null)
        TEAMMATES=$(python3 -c "import json; d=json.load(open('$STATE_FILE')); print(d.get('teammates', 0))" 2>/dev/null)
        STEP="$2"

        if [ "$TIER" = "quick" ]; then
            exit 0
        fi

        # Standard and Full: teammates are required for parallelizable steps
        if [ "$TIER" = "standard" ] || [ "$TIER" = "full" ]; then
            if [ "$STEP" = "hands-build" ] && [ "$TEAMMATES" -eq 0 ]; then
                echo "{\"systemMessage\": \"ORGANISM: Standard/Full tier requires Agent Teams for Step 4 (Build) when tasks are independent. Spawn workers via /organism:split or use Agent Teams directly.\"}"
            fi
            if [ "$STEP" = "spine-verify" ] && [ "$TEAMMATES" -eq 0 ]; then
                echo "{\"systemMessage\": \"ORGANISM: Standard/Full tier requires parallel verification in Step 5. Spawn verifiers for code review + browser QA simultaneously.\"}"
            fi
        fi
        exit 0
        ;;

    override)
        # Log that a gate was overridden
        python3 -c "
import json
d = json.load(open('$STATE_FILE'))
d['overrides'] = d.get('overrides', 0) + 1
with open('$STATE_FILE', 'w') as f:
    json.dump(d, f, indent=2)
    f.write('\n')
print(f\"Override logged ({d['overrides']} this task)\")
"
        ;;

    tier)
        # Get or set default tier
        CONFIG_DIR="$HOME/.organism"
        CONFIG_FILE="$CONFIG_DIR/config.json"
        mkdir -p "$CONFIG_DIR"

        if [ -z "$2" ]; then
            # Get current tier
            if [ -f "$CONFIG_FILE" ]; then
                python3 -c "import json; print(json.load(open('$CONFIG_FILE')).get('tier', 'standard'))" 2>/dev/null
            else
                echo "standard"
            fi
        else
            # Set tier
            TIER="$2"
            case "$TIER" in
                quick|standard|full)
                    if [ ! -f "$CONFIG_FILE" ]; then
                        echo "{}" > "$CONFIG_FILE"
                    fi
                    python3 -c "
import json
p = '$CONFIG_FILE'
d = json.load(open(p))
d['tier'] = '$TIER'
with open(p, 'w') as f:
    json.dump(d, f, indent=2)
    f.write('\n')
"
                    echo "Default tier set to: $TIER"
                    ;;
                *)
                    echo "Invalid tier. Use: quick, standard, or full"
                    exit 1
                    ;;
            esac
        fi
        ;;

    *)
        echo "Usage: protocol.sh {start|mark|check|check-teammates|status|complete|skip|override|teammate|tier} [args]"
        exit 1
        ;;
esac
