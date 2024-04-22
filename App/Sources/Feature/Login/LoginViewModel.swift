import Combine
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final class LoginViewModel: BaseViewModel {
    @Published var isSuccessLogin = false
    func kakaoButtonDidTap() {
        // 카카오 로그인
        //self.isSuccessLogin.toggle()
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                self.isSuccessLogin.toggle()
            }
        } else {
            self.isSuccessLogin.toggle()
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                
            }
        }
    }
}
