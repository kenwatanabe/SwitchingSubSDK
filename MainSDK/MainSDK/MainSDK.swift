import Foundation
import SubSDKInterface

#if SUBSDK_A
import SubSDK_A
#else
import SubSDK_B
#endif

public class MainSDKManager {
    // シングルトンとして内部でサブSDKのインスタンスを生成
    
    public static let shared: MainSDKManager = {
        
#if SUBSDK_A
        let subSDK = SubSDK_A()
#else
        let subSDK = SubSDK_B()
#endif
        
        return MainSDKManager(subSDK: subSDK)
    }()
    
    private let subSDK: SubSDKProtocol
    
    private init(subSDK: SubSDKProtocol) {
        self.subSDK = subSDK
    }
    
    public func processICCardScan() {
        if let data = subSDK.scanICCard() {
            print("ICカードデータ: \(data)")
        } else {
            print("ICカードのスキャンに失敗しました！")
        }
    }
}
