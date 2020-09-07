#!/usr/bin/env bash
#
# Environment variables:
#
# * `NODE_INSTALLER`: Which Node.js package manager to use (`yarn` or `npm`). Defaults to detecting
#   which package manager was used on the app via `yarn-or-npm` (which is used by Electron Forge).
#

set -e

args=(
  --skip-package
  --targets
  "$TARGET_MAKER"
  --platform
  "$TARGET_PLATFORM"
)

if [[ -n "$TARGET_ARCH" ]]; then
  args=( ${args[@]} --arch "$TARGET_ARCH" )
fi

if [[ "$NODE_INSTALLER" = "npm" ]]; then
  npm run make -- "${args[@]}"
elif [[ "$NODE_INSTALLER" = "yarn" ]]; then
  yarn make "${args[@]}"
else
  "$(npm bin)"/yarn-or-npm run make -- "${args[@]}"
fi
