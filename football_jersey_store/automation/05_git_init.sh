#!/usr/bin/env bash
# Phase 5: Initialize git, make first commit, prepare for push
# Usage:  ./05_git_init.sh <github_username> [target_dir]
# Example: ./05_git_init.sh kunach-itcs424

USERNAME="${1:?Usage: $0 <github_username> [target_dir]}"
TARGET="${2:-$HOME/Documents/FlutterProjects/football_jersey_store}"
REPO="football-jersey-store-itcs424"
URL="https://github.com/$USERNAME/$REPO.git"

cd "$TARGET"

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add .
git commit -m "ITCS424 Football Jersey Store — initial submission" || echo "(nothing to commit)"

# Set or update remote
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$URL"
else
  git remote add origin "$URL"
fi

echo ""
echo "✅ Local repo ready."
echo ""
echo "👉 Next manual steps (browser):"
echo "   1. Create the repo on GitHub: https://github.com/new"
echo "      Name: $REPO   |   Public   |   (do NOT add README)"
echo "   2. Then run:    git push -u origin main"
echo "   3. Add collaborator 'siripenp' in repo Settings → Collaborators"
