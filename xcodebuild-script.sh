#!bin/bash

echo $LLVM_SYMBOLIZER_PATH

xcodebuild -project NativePopup/NativePopup.xcodeproj -scheme NativePopup-Package -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR=.
