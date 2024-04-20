import SwiftUI
import DesignSystem

struct LoginView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: LoginViewModel = .init()

    var body: some View {
        VStack {
            Spacer()

            ATImage(.aeTeutSplashLogo)
                .frame(width: 186.5, height: 64)
                .padding(.top, 278)
                .padding(.bottom, 288)

            Spacer()

            VStack(spacing: 12) {
                Button(action: viewModel.kakaoButtonDidTap) {
                    HStack(spacing: 8) {
                        ATIcon(.kakaoLogo)
                            .frame(20)

                        Text("카카오로 로그인")
                            .atFont(.subHeadLine, color: .gray10)
                    }
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(Color.Logo.kakaoBG)
                    .cornerRadius(8)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
        }
        .background(Color(.black))
        .onChange(of: viewModel.isSuccessLogin) { _ in
            appState.sceneFlow = .main
        }
    }
}

#Preview {
    LoginView()
}
