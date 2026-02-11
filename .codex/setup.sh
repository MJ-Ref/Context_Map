#!/usr/bin/env bash
# Codex sandbox setup — installs dependencies and prepares the environment
# This script runs automatically when Codex starts a session

set -euo pipefail

# No build dependencies for this template repo — it's pure documentation.
# When adapting Context_Map for a real project, add your setup steps here:
#   npm install / pip install -r requirements.txt / etc.

echo "Context_Map environment ready."
