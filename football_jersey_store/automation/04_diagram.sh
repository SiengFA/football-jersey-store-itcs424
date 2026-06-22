#!/usr/bin/env bash
# Phase 4: Re-render Class Diagram from SVG → PNG (uses cairosvg)
TARGET="${1:-$HOME/Documents/FlutterProjects/football_jersey_store}"
SVG="$TARGET/docs/model_diagram.svg"
PNG="$TARGET/docs/model_diagram.png"
echo "🖼  Rendering diagram from $SVG ..."
pip install --quiet --break-system-packages cairosvg 2>/dev/null || pip install --quiet cairosvg
python3 - <<PY
import cairosvg
cairosvg.svg2png(url="$SVG", write_to="$PNG", output_width=2200)
print("✅ Saved: $PNG")
PY
