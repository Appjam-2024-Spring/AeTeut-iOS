import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "AeTeut-iOS",
    organizationName: "com.appjam",
    settings: .settings(
        configurations: [
            .debug(name: .debug),
            .release(name: .release)
        ]
    ),
    targets: [
        Target(
            name: "AeTeut-iOS",
            platform: .iOS,
            product: .app,
            bundleId: "com.appjam.aeteut",
            deploymentTarget: .iOS(
                targetVersion: "16.0",
                devices: .iphone
            ),
            infoPlist: .file(path: Path("SupportingFiles/Info.plist")),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .Domain,
                .DesignSystem,
                .SPM.MonthYearWheelPicker
            ]
        )
    ]
)
