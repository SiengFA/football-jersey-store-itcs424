#!/usr/bin/env bash
# Phase 3: Static analyze + unit tests
TARGET="${1:-$HOME/Documents/FlutterProjects/football_jersey_store}"
cd "$TARGET"
echo "🧪 flutter analyze..."
flutter analyze || true
echo ""
echo "🧪 flutter test..."
flutter test || true
