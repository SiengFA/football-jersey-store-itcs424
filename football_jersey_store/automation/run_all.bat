@echo off
if "%~1"=="" (
  echo Usage: run_all.bat ^<github_username^>
  exit /b 1
)
call 00_doctor.bat || exit /b 1
call 01_setup.bat
call 05_git_init.bat %1
echo.
echo Done! Manual steps remaining:
echo   - Phase 2: 02_run.bat
echo   - Phase 6: Record video, upload YouTube Unlisted
echo   - Phase 7: git push -u origin main, add siripenp as collaborator
echo   - Phase 8: python 06_email.py ^<github_url^> ^<youtube_url^>
