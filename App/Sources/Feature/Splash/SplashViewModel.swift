import Combine
import Foundation

final class SplashViewModel: BaseViewModel {
    func onAppear(
        onSuccess: @escaping () -> Void,
        onError: @escaping () -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            onError() // Login 으로
    //        onSuccess()  Main 으로
        }
    }
}
