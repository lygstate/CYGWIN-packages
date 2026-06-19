@echo off
cd /d %~dp0
node scripts/build-all.ts %*
exit /B %ERRORLEVEL%
