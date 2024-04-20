import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Moya = TargetDependency.external(name: "Moya")
    static let CombineMoya = TargetDependency.external(name: "CombineMoya")
    static let MonthYearWheelPicker = TargetDependency.external(name: "MonthYearWheelPicker")
}

public extension Package {}
