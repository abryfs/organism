#!/usr/bin/env node

const { execFileSync } = require("child_process");
const path = require("path");
const fs = require("fs");

const INSTALL_DIR = path.join(
  process.env.HOME || process.env.USERPROFILE,
  ".claude",
  "skills",
  "organism"
);

const REPO_URL = "https://github.com/abryfs/organism.git";

function main() {
  const command = process.argv[2] || "install";

  switch (command) {
    case "install":
      install();
      break;
    case "update":
      update();
      break;
    case "version":
      version();
      break;
    default:
      console.log("Usage: npx organism-ai [install|update|version]");
      process.exit(1);
  }
}

function install() {
  if (fs.existsSync(INSTALL_DIR)) {
    console.log("Organism already installed at " + INSTALL_DIR);
    console.log("Run: npx organism-ai update");
    return;
  }

  console.log("Installing Organism...");

  try {
    execFileSync("git", ["clone", REPO_URL, INSTALL_DIR], {
      stdio: "inherit",
    });
    execFileSync("chmod", ["+x", path.join(INSTALL_DIR, "setup")]);
    execFileSync(path.join(INSTALL_DIR, "setup"), [], { stdio: "inherit" });
  } catch (err) {
    console.error("Install failed:", err.message);
    process.exit(1);
  }
}

function update() {
  if (!fs.existsSync(INSTALL_DIR)) {
    console.log("Organism not installed. Run: npx organism-ai install");
    return;
  }

  const oldVersion = fs
    .readFileSync(path.join(INSTALL_DIR, "VERSION"), "utf8")
    .trim();

  console.log("Current version: " + oldVersion);
  console.log("Pulling latest...");

  try {
    execFileSync("git", ["pull", "origin", "main"], {
      cwd: INSTALL_DIR,
      stdio: "inherit",
    });
  } catch (err) {
    console.error("Update failed:", err.message);
    process.exit(1);
  }

  const newVersion = fs
    .readFileSync(path.join(INSTALL_DIR, "VERSION"), "utf8")
    .trim();

  if (oldVersion === newVersion) {
    console.log("Already up to date (" + newVersion + ").");
  } else {
    console.log("Updated: " + oldVersion + " -> " + newVersion);
  }
}

function version() {
  if (!fs.existsSync(INSTALL_DIR)) {
    console.log("Organism not installed.");
    return;
  }

  const ver = fs
    .readFileSync(path.join(INSTALL_DIR, "VERSION"), "utf8")
    .trim();
  console.log("Organism v" + ver);
  console.log("Installed at: " + INSTALL_DIR);
}

main();
