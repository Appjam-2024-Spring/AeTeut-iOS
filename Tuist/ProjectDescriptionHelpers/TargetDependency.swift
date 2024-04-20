import ProjectDescription

extension TargetDependency {
    public static let Domain = Self.moduleTarget(name: "Domain")
    public static let DesignSystem = Self.moduleTarget(name: "DesignSystem")

    private static func moduleTarget(name: String) -> TargetDependency {
        return TargetDependency.project(
            target: name,
            path: .relativeToRoot("\(name)")
        )
    }

}
