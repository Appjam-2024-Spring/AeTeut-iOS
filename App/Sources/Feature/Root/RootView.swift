import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        ZStack {
            switch appState.sceneFlow {
            case .login:
//                LoginView()
//                    .environmentObject(appState)
                ReceiveObituaryView()

            case .main:
                NavigationView {
                    MainView()
                        .environmentObject(appState)
                }

            case .splash:
                SplashView()
                    .environmentObject(appState)
            }
        }
        .animation(.easeInOut, value: appState.sceneFlow)
        .transition(.opacity.animation(.easeInOut))
    }
}
