import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(
                url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.3")
            ),
            .remote(
                url: "https://github.com/bendodson/MonthYearWheelPicker.git",
                requirement: .branch("master")
            ),
            .remote(
                url: "https://github.com/kakao/kakao-ios-sdk.git",
                requirement: .branch("master")
            )
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ]
        )
    ),
    platforms: [.iOS]
)
