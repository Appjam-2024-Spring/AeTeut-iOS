import SwiftUI
import DesignSystem

struct SetNumberView: View {
    @State var number: String = ""
    @State var isNavigatedToSetDateView = false
    var body: some View {
        VStack(spacing: .zero) {
            ATTextField("01012345678 ", title: "연락처", text: $number)
                .keyboardType(.numberPad)

            Spacer()
            
            ATButton(text: "다음", style: .main) {
                isNavigatedToSetDateView = true
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton(navigationTitleStyle: .large("연락처를 알려주세요."))
        .navigate(to: SetDateView(), when: $isNavigatedToSetDateView)
    }
}
