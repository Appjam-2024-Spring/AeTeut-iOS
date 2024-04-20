import SwiftUI
import DesignSystem

struct SetNameView: View {
    @State var name: String = ""
    @State var isNavigatedToSetNumberView = false
    var body: some View {
        VStack(spacing: .zero) {
            ATTextField("홍길동", title: "성함", text: $name)
                .keyboardType(.namePhonePad)

            Spacer()
            
            ATButton(text: "다음", style: .main) {
                isNavigatedToSetNumberView = true
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton(navigationTitleStyle: .large("고인의 성함을 알려주세요."))
        .navigate(to: SetNumberView(), when: $isNavigatedToSetNumberView)
    }
}
