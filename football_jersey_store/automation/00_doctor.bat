@echo off
echo ITCS424 Jersey Agent - Environment Doctor
echo ==========================================
where flutter >nul 2>&1 && (echo   [OK] Flutter found) || (echo   [MISSING] Flutter && set MISSING=1)
where git     >nul 2>&1 && (echo   [OK] Git found)     || (echo   [MISSING] Git     && set MISSING=1)
where code    >nul 2>&1 && (echo   [OK] VS Code found) || (echo   [MISSING] VS Code (optional))
if defined MISSING (
  echo.
  echo Install missing tools, then re-run.
  exit /b 1
)
echo.
echo All prerequisites installed - ready for Phase 1.
