### 複数のサブSDKを切り替えるサンプル
`MainSDK`の中で`SubSDK_A`と`SubSDK_B`のインポートや処理を、プリプロセッサー定数をみて切り替えを行う。  
プリプロセッサー定数は手動で書き換えているが、スキームごとに以下のように設定してスキーム切り替えでも良いかも  
`ABuildScheme`=>`SUBSDK_A`を設定  
`BBuildScheme`=>`SUBSDK_B`を設定

#### SubSDK_Aを使う場合
`MainSDK`の`Other Swift Flags`に`-D SUBSDK_A`を設定  
`MainSDK`のxcframeworkを作成
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
`MainSDK`のxcframeworkを作成
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
