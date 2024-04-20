import SwiftUI
import DesignSystem

struct SetDateView: View {
    @State var date: Date = Date().adding(by: .day, value: 3)
    @State var isNavigatedToSetDateView = false

    var body: some View {
        VStack(spacing: .zero) {
            CalendarView(selectedDate: $date)
                .padding(.horizontal, 20)

            Spacer()
            
            ATButton(text: "다음", style: .main) {
                isNavigatedToSetDateView = true
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton(navigationTitleStyle: .large("발인일을 알려주세요"))
    }
}
