#!/bin/bash -xe

case "$(uname -s)" in
  "Linux")
    case "$TARGET_MAKER" in
      "@electron-forge/maker-deb")
        sudo apt-get install --yes --no-install-recommends fakeroot dpkg
        ;;
      "@electron-forge/maker-rpm")
        sudo apt-get install --yes --no-install-recommends rpm
        ;;
      "@electron-forge/maker-flatpak")
        "$(dirname $0)"/flatpak-dependencies.sh
        ;;
      "@electron-forge/maker-snap")
        "$(dirname $0)"/snap-dependencies.sh
        ;;
    esac
    ;;
  "Windows"*|"MINGW"*|"MSYS"*)
    if [[ "$TARGET_MAKER" = "@electron-forge/maker-wix" ]]; then
      echo 'C:\Program Files (x86)\WiX Toolset v3.11\bin' >> $GITHUB_PATH
    fi
    ;;
esac
