#!/usr/bin/env bash
# Phase 2: Run the Flutter app on Chrome
TARGET="${1:-$HOME/Documents/FlutterProjects/football_jersey_store}"
echo "🚀 Running app on Chrome from: $TARGET"
cd "$TARGET"
flutter run -d chrome
