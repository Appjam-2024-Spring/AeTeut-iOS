import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .login:
                LoginView()
                    .environmentObject(appState)

            case .main:
                EmptyView()
                    .environmentObject(appState)

            case .splash:
                SplashView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
