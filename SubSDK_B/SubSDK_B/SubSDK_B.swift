import SubSDKInterface

public class SubSDK_B: SubSDKProtocol {
    public init() {}
    
    public func scanICCard() -> String? {
        return "ICカードデータ_B"
    }
}
