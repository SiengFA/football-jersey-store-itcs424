@echo off
if "%~1"=="" (
  echo Usage: 05_git_init.bat ^<github_username^>
  exit /b 1
)
set USERNAME=%1
set REPO=football-jersey-store-itcs424
set TARGET=%USERPROFILE%\Documents\FlutterProjects\football_jersey_store
cd /d "%TARGET%"

if not exist .git (
  git init
  git branch -M main
)
git add .
git commit -m "ITCS424 Football Jersey Store - initial submission"
git remote remove origin 2>nul
git remote add origin https://github.com/%USERNAME%/%REPO%.git

echo.
echo Local repo ready. Now:
echo   1. Create GitHub repo: https://github.com/new
echo      Name: %REPO%   Public   (no README)
echo   2. Run: git push -u origin main
echo   3. Add collaborator 'siripenp' in repo Settings
