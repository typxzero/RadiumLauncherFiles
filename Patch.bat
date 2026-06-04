@echo off
set "PATCH_URL=https://cdn.recroomarchive.org/radium/game-client/production/toukeh24kq6w2v4lndyc4z0pblvfyj75/windows/patch.zip"
set "SEVENZIP_PATH=%~1"

if "%SEVENZIP_PATH%"=="" (
    echo Error: 7z binary path not provided.
    exit /b 1
)

curl -L -o patch.zip %PATCH_URL%

"%SEVENZIP_PATH%" x patch.zip -y

move /Y "Radeon.Core.BasePatch.dll" "client\BepInEx\plugins\Radeon.Core.BasePatch.dll"

if exist patch.zip del patch.zip

exit /b 0
