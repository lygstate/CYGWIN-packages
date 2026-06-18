pushd "%~dp0"

if exist msys64-to-delete (
  call :safe_unlink_dir msys64-to-delete\var\cache\pacman\pkg
  call :safe_unlink_dir msys64-to-delete\home
  rd /s /q msys64-to-delete
)
if exist msys64 (rename msys64 msys64-to-delete)
if exist msys64 (
  echo "Delete msys64 failed"
)
if exist msys64-to-delete (
  call :safe_unlink_dir msys64-to-delete\var\cache\pacman\pkg
  call :safe_unlink_dir msys64-to-delete\home
  rd /s /q msys64-to-delete
)

popd

if defined CI_TOOLS_DISABLE_PAUSE ( goto :eof )
pause

:eof

:safe_unlink_dir
if not exist "%~1" exit /B 0
rmdir "%~1" 2>nul
if exist "%~1" rd /s /q "%~1"
exit /B 0
