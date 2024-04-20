import Combine

final class LoginViewModel: BaseViewModel {
    @Published var isSuccessLogin = false
    func kakaoButtonDidTap() {
        // 카카오 로그인
        self.isSuccessLogin.toggle()
    }
}
