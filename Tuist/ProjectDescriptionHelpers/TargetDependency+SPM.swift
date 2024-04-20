import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let CombineMoya = TargetDependency.external(name: "CombineMoya")
    static let MonthYearWheelPicker = TargetDependency.external(name: "MonthYearWheelPicker")
    static let KakaoSDKAuth = TargetDependency.external(name: "KakaoSDKAuth")
    static let KakaoSDKCommon = TargetDependency.external(name: "KakaoSDKCommon")
    static let KakaoSDKUser = TargetDependency.external(name: "KakaoSDKUser")
    static let KakaoSDKShare = TargetDependency.external(name: "KakaoSDKShare")
    static let KakaoSDKTemplate = TargetDependency.external(name: "KakaoSDKTemplate")
}

public extension Package {}
