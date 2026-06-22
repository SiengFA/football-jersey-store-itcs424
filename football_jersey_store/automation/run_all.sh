#!/usr/bin/env bash
# 🤖 ITCS424 Jersey Agent — Master Orchestrator
# Runs every automatable phase end-to-end.
# Usage:  ./run_all.sh <github_username>

set -e
USERNAME="${1:?Usage: $0 <github_username>}"
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TARGET="$HOME/Documents/FlutterProjects/football_jersey_store"

cat <<BANNER
╔════════════════════════════════════════════════════╗
║  🤖 ITCS424 Jersey Agent — End-to-End Run          ║
║  Student: Kunach Samutvanit (6488188)              ║
╚════════════════════════════════════════════════════╝
BANNER

echo ""
echo "[Phase 0] Doctor"
"$THIS_DIR/00_doctor.sh" || { echo "❌ Fix prerequisites first"; exit 1; }

echo ""
echo "[Phase 1] Setup"
"$THIS_DIR/01_setup.sh" "$TARGET"

echo ""
echo "[Phase 3] Static analyze + tests"
"$THIS_DIR/03_test.sh" "$TARGET" || true

echo ""
echo "[Phase 4] Diagram"
"$THIS_DIR/04_diagram.sh" "$TARGET" || echo "(skipped — cairosvg not available)"

echo ""
echo "[Phase 5] Git init + commit"
"$THIS_DIR/05_git_init.sh" "$USERNAME" "$TARGET"

cat <<DONE

╔════════════════════════════════════════════════════╗
║  ✅ Automated phases done!                         ║
╠════════════════════════════════════════════════════╣
║  Manual steps remaining (only YOU can do these):   ║
║                                                    ║
║  ▶ Phase 2  Run app:   $THIS_DIR/02_run.sh         ║
║  ▶ Phase 6  Record video → upload YouTube Unlisted ║
║  ▶ Phase 7  git push -u origin main                ║
║  ▶ Phase 7  Add 'siripenp' as collaborator         ║
║  ▶ Phase 8  python3 06_email.py <github> <youtube> ║
╚════════════════════════════════════════════════════╝
DONE
