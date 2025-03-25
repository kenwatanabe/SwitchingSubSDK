### 複数のサブSDKを切り替えるサンプル
`MainSDK`の中で`SubSDK_A`のインポートと`SubSDK_B`のインポートを切り替えて使う  
今は手動で切り替えだがターゲットで設定しておいても良さそう

#### SubSDK_Aを使う場合
`MainSDK`の`Other Swift Flags`に`-D SUBSDK_A`を設定  
`SampleApp`に以下の`xcframework`をインポート
```
SampleApp/
├── MainSDK.xcframework
├── SubSDK_A.xcframework
└── SubSDKInterface.xcframework

MainSDK/
├── SubSDK_A.xcframework
└── SubSDKInterface.xcframework

SubSDK_A/
└── SubSDKInterface.xcframework
```

#### SubSDK_Bを使う場合
`MainSDK`の`Other Swift Flags`に`-D SUBSDK_B`を設定  
`SampleApp`に以下の`xcframework`をインポート
```
SampleApp/
├── MainSDK.xcframework
├── SubSDK_B.xcframework
└── SubSDKInterface.xcframework

MainSDK/
├── SubSDK_B.xcframework
└── SubSDKInterface.xcframework

SubSDK_B/
└── SubSDKInterface.xcframework
```

#### build_all.sh
4つ分yes/noを聞かれるのでビルドしたいものだけyにする
