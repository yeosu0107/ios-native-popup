#!bin/bash

cd NativePopup

# xcodeproj μμ±
swift package generate-xcodeproj --skip-extra-files

# framework λΉλ
xcodebuild -project NativePopup.xcodeproj -scheme NativePopup-Package -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR=. SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -rf *.dSYM
rm -rf *.xcodeproj