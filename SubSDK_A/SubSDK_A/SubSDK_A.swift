import SubSDKInterface

public class SubSDK_A: SubSDKProtocol {
    public init() {}
    
    public func scanICCard() -> String? {
        return "ICカードデータ_A"
    }
}
