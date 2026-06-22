#!/usr/bin/env bash
# ITCS424 Jersey Agent — Phase 1: Scaffold Flutter project + inject our code
# Usage:  ./01_setup.sh [target_directory]
# Default: ~/Documents/FlutterProjects/football_jersey_store

set -e
TARGET="${1:-$HOME/Documents/FlutterProjects/football_jersey_store}"
THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$( cd "$THIS_DIR/.." && pwd )"

echo "📦 Phase 1: Setting up Flutter project at"
echo "   $TARGET"
echo "==========================================="

mkdir -p "$(dirname "$TARGET")"

if [ ! -d "$TARGET" ]; then
  echo "▶ Creating fresh Flutter project..."
  flutter create "$TARGET"
else
  echo "▶ Project already exists, will overlay our files."
fi

echo "▶ Copying our code into project..."
mkdir -p "$TARGET/lib/models" "$TARGET/lib/widgets" "$TARGET/lib/screens" "$TARGET/docs"
cp "$PROJECT_ROOT/lib/main.dart"                         "$TARGET/lib/main.dart"
cp "$PROJECT_ROOT/lib/models/product.dart"               "$TARGET/lib/models/product.dart"
cp "$PROJECT_ROOT/lib/widgets/product_card.dart"         "$TARGET/lib/widgets/product_card.dart"
cp "$PROJECT_ROOT/lib/screens/product_list_screen.dart"  "$TARGET/lib/screens/product_list_screen.dart"
cp "$PROJECT_ROOT/README.md"                             "$TARGET/README.md"
cp "$PROJECT_ROOT/.gitignore"                            "$TARGET/.gitignore"
cp -r "$PROJECT_ROOT/docs/."                             "$TARGET/docs/"

echo "▶ Running flutter pub get..."
( cd "$TARGET" && flutter pub get )

echo ""
echo "🎉 Phase 1 complete!"
echo "   Project ready at: $TARGET"
echo "   Next: ./02_run.sh \"$TARGET\""
