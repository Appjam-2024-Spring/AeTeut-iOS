import SwiftUI
import DesignSystem

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SplashViewModel = .init()

    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

            ATImage(.aeTeutSplashLogo)
                .frame(width: 186.5, height: 64)
        }
        .onAppear {
            viewModel.onAppear {
                appState.sceneFlow = .main
            } onError: {
                appState.sceneFlow = .login
            }
        }
    }
}

#Preview {
    SplashView()
}
