import SwiftUI
import DesignSystem
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct JOBISApp: App {
    @StateObject var appState = AppState(sceneFlow: .splash)
    
    init() {
            // Kakao SDK 초기화
            KakaoSDK.initSDK(appKey:"f1267fdcfe942ded7fd5e11679938800")
            DesignSystemFontFamily.registerAllCustomFonts()
        }

    var body: some Scene {
        WindowGroup {
            RootView()
//                .preferredColorScheme(.light)
                .environmentObject(appState)
                .onOpenURL { url in
                                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                        _ = AuthController.handleOpenUrl(url: url)
                                    }
                                }
        }
    }
}
