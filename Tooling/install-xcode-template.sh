#!/usr/bin/env sh

# Configuration
XCODE_TEMPLATE_DIR=$HOME'/Library/Developer/Xcode/Templates/File Templates/NeedleRIBs'
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy RIBs file templates into the local RIBs template directory
xcodeTemplate () {
  echo "==> Copying up Needle RIBs Xcode file templates..."

  if [ -d "$XCODE_TEMPLATE_DIR" ]; then
    rm -R "$XCODE_TEMPLATE_DIR"
  fi
  mkdir -p "$XCODE_TEMPLATE_DIR"

  cp -R $SCRIPT_DIR/*.xctemplate "$XCODE_TEMPLATE_DIR"
}

xcodeTemplate

echo "==> ... success!"
echo "==> Needle RIBs have been set up. In Xcode, select 'New File...' to use Needle RIBs templates."
