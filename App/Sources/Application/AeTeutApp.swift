import SwiftUI
import DesignSystem

@main
struct JOBISApp: App {
    @StateObject var appState = AppState(sceneFlow: .splash)

    init() {
        DesignSystemFontFamily.registerAllCustomFonts()
    }

    var body: some Scene {
        WindowGroup {
            RootView()
//                .preferredColorScheme(.light)
                .environmentObject(appState)
        }
    }
}
