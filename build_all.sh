#!/bin/bash
set -e

BUILD_DIR="./build"
mkdir -p "$BUILD_DIR"

# 質問を全てしてから、変数に回答を保存する
read -p "SubSDKInterfaceはビルドしますか？ (y/n): " ans1
read -p "SubSDK_Aはビルドしますか？ (y/n): " ans2
read -p "SubSDK_Bはビルドしますか？ (y/n): " ans3
read -p "MainSDKはビルドしますか？ (y/n): " ans4

# -----------------------------------------------------
# SubSDKInterface.xcframework をビルドする関数
# -----------------------------------------------------
build_SubSDKInterface() {
    echo "=== Archiving SubSDKInterface for iOS ==="
    xcodebuild archive \
      -project SubSDKInterface/SubSDKInterface.xcodeproj \
      -scheme "SubSDKInterface" \
      -destination "generic/platform=iOS" \
      -archivePath "$BUILD_DIR/SubSDKInterface-iOS.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Archiving SubSDKInterface for iOS Simulator ==="
    xcodebuild archive \
      -project SubSDKInterface/SubSDKInterface.xcodeproj \
      -scheme "SubSDKInterface" \
      -destination "generic/platform=iOS Simulator" \
      -archivePath "$BUILD_DIR/SubSDKInterface-iOSSimulator.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Creating SubSDKInterface.xcframework ==="
    xcodebuild -create-xcframework \
      -framework "$BUILD_DIR/SubSDKInterface-iOS.xcarchive/Products/Library/Frameworks/SubSDKInterface.framework" \
      -framework "$BUILD_DIR/SubSDKInterface-iOSSimulator.xcarchive/Products/Library/Frameworks/SubSDKInterface.framework" \
      -output "$BUILD_DIR/SubSDKInterface.xcframework"
}

# -----------------------------------------------------
# SubSDK_A.xcframework をビルドする関数
# -----------------------------------------------------
build_SubSDK_A() {
    echo "=== Archiving SubSDK_A for iOS ==="
    xcodebuild archive \
      -project SubSDK_A/SubSDK_A.xcodeproj \
      -scheme "SubSDK_A" \
      -destination "generic/platform=iOS" \
      -archivePath "$BUILD_DIR/SubSDK_A-iOS.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Archiving SubSDK_A for iOS Simulator ==="
    xcodebuild archive \
      -project SubSDK_A/SubSDK_A.xcodeproj \
      -scheme "SubSDK_A" \
      -destination "generic/platform=iOS Simulator" \
      -archivePath "$BUILD_DIR/SubSDK_A-iOSSimulator.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Creating SubSDK_A.xcframework ==="
    xcodebuild -create-xcframework \
      -framework "$BUILD_DIR/SubSDK_A-iOS.xcarchive/Products/Library/Frameworks/SubSDK_A.framework" \
      -framework "$BUILD_DIR/SubSDK_A-iOSSimulator.xcarchive/Products/Library/Frameworks/SubSDK_A.framework" \
      -output "$BUILD_DIR/SubSDK_A.xcframework"
}

# -----------------------------------------------------
# SubSDK_B.xcframework をビルドする関数
# -----------------------------------------------------
build_SubSDK_B() {
    echo "=== Archiving SubSDK_B for iOS ==="
    xcodebuild archive \
      -project SubSDK_B/SubSDK_B.xcodeproj \
      -scheme "SubSDK_B" \
      -destination "generic/platform=iOS" \
      -archivePath "$BUILD_DIR/SubSDK_B-iOS.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Archiving SubSDK_B for iOS Simulator ==="
    xcodebuild archive \
      -project SubSDK_B/SubSDK_B.xcodeproj \
      -scheme "SubSDK_B" \
      -destination "generic/platform=iOS Simulator" \
      -archivePath "$BUILD_DIR/SubSDK_B-iOSSimulator.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Creating SubSDK_B.xcframework ==="
    xcodebuild -create-xcframework \
      -framework "$BUILD_DIR/SubSDK_B-iOS.xcarchive/Products/Library/Frameworks/SubSDK_B.framework" \
      -framework "$BUILD_DIR/SubSDK_B-iOSSimulator.xcarchive/Products/Library/Frameworks/SubSDK_B.framework" \
      -output "$BUILD_DIR/SubSDK_B.xcframework"
}

# -----------------------------------------------------
# MainSDK.xcframework をビルドする関数
# -----------------------------------------------------
build_MainSDK() {
    echo "=== Archiving MainSDK for iOS ==="
    xcodebuild archive \
      -project MainSDK/MainSDK.xcodeproj \
      -scheme "MainSDK" \
      -destination "generic/platform=iOS" \
      -archivePath "$BUILD_DIR/MainSDK-iOS.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Archiving MainSDK for iOS Simulator ==="
    xcodebuild archive \
      -project MainSDK/MainSDK.xcodeproj \
      -scheme "MainSDK" \
      -destination "generic/platform=iOS Simulator" \
      -archivePath "$BUILD_DIR/MainSDK-iOSSimulator.xcarchive" \
      SKIP_INSTALL=NO \
      BUILD_LIBRARY_FOR_DISTRIBUTION=YES

    echo "=== Creating MainSDK.xcframework ==="
    xcodebuild -create-xcframework \
      -framework "$BUILD_DIR/MainSDK-iOS.xcarchive/Products/Library/Frameworks/MainSDK.framework" \
      -framework "$BUILD_DIR/MainSDK-iOSSimulator.xcarchive/Products/Library/Frameworks/MainSDK.framework" \
      -output "$BUILD_DIR/MainSDK.xcframework"
}

# -----------------------------------------------------
# 全ての質問に答え終わった後で、選択されたフレームワークのビルドを実行する
# -----------------------------------------------------

if [[ "$ans1" == "y" || "$ans1" == "Y" ]]; then
    build_SubSDKInterface
fi

if [[ "$ans2" == "y" || "$ans2" == "Y" ]]; then
    build_SubSDK_A
fi

if [[ "$ans3" == "y" || "$ans3" == "Y" ]]; then
    build_SubSDK_B
fi

if [[ "$ans4" == "y" || "$ans4" == "Y" ]]; then
    build_MainSDK
fi

echo "=== 選択されたフレームワークのビルドが完了しました！ ==="
