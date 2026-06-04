#!/bin/bash
PATCH_URL="https://cdn.recroomarchive.org/radium/game-client/production/toukeh24kq6w2v4lndyc4z0pblvfyj75/windows/patch.zip"
SEVENZIP_PATH="$1"

if [ -z "$SEVENZIP_PATH" ]; then
    echo "Error: 7z binary path not provided."
    exit 1
fi

curl -L -o patch.zip "$PATCH_URL"

"$SEVENZIP_PATH" x patch.zip -y

mkdir -p "client/BepInEx/plugins"
mv -f "Radeon.Core.BasePatch.dll" "client/BepInEx/plugins/Radeon.Core.BasePatch.dll"

if [ -f patch.zip ]; then rm patch.zip; fi

exit 0
