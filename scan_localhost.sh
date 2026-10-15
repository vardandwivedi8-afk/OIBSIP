#!/usr/bin/env bash
set -euo pipefail

# Safe default: scan only the local computer.
TARGET="127.0.0.1"
OUTPUT="nmap_scan_results.txt"

if ! command -v nmap >/dev/null 2>&1; then
  echo "Nmap was not found. Install it from https://nmap.org/download.html"
  exit 1
fi

{
  echo "OIBSIP Task 1 — Basic Network Scanning with Nmap"
  echo "Run date (UTC): $(date -u '+%Y-%m-%d %H:%M:%S')"
  echo "Target: ${TARGET}"
  echo "Command: nmap -sV --top-ports 1000 ${TARGET}"
  echo "Scope: localhost only"
  echo
  nmap -sV --top-ports 1000 "${TARGET}"
} | tee "${OUTPUT}"

echo
echo "Saved actual scan output to: ${OUTPUT}"
