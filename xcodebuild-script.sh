#!bin/bash

cd NativePopup

# xcodeproj 생성
swift package generate-xcodeproj --skip-extra-files

# framework 빌드
xcodebuild -project NativePopup.xcodeproj -scheme NativePopup-Package -configuration Release -sdk iphoneos CONFIGURATION_BUILD_DIR=. SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

rm -rf *.dSYM
rm -rf *.xcodeproj