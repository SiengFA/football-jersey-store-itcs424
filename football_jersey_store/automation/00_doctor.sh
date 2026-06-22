#!/usr/bin/env bash
# ITCS424 Jersey Agent — Phase 0: Environment Doctor
# Checks all prerequisites and tells you exactly what's missing.

set -e
echo "🩺 ITCS424 Jersey Agent — Environment Doctor"
echo "==========================================="

OK=true

check() {
  local name="$1"; local cmd="$2"
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "  ✅ $name : $($cmd --version 2>/dev/null | head -1)"
  else
    echo "  ❌ $name : NOT FOUND"
    OK=false
  fi
}

check "Flutter" flutter
check "Dart"    dart
check "Git"     git
check "VS Code" code

if [ "$OK" = true ]; then
  echo ""
  echo "🎉 All prerequisites installed — ready for Phase 1."
  exit 0
else
  echo ""
  echo "⚠️  Install missing tools first:"
  echo "    Flutter:  https://docs.flutter.dev/get-started/install"
  echo "    Git:      https://git-scm.com/downloads"
  echo "    VS Code:  https://code.visualstudio.com/"
  exit 1
fi
