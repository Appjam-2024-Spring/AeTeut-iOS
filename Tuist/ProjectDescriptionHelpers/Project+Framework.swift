import ProjectDescription

extension Project {
    public static func framework(
        name: String,
        platform: Platform,
        infoPlist: InfoPlist = .default,
        hasResources: Bool = false,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "com.appjam.aeteut.\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "16.0",
                        devices: [.iphone, .ipad]
                    ),
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    resources: hasResources ? ["Resources/**"]: [],
                    dependencies: dependencies
                )
            ]
        )
    }
}
