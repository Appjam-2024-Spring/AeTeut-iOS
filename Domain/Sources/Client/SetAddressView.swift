import SwiftUI
import DesignSystem

struct SetAddressView: View {
    @State var text: String = ""

    var body: some View {
        VStack(spacing: .zero) {
            CalendarView(selectedDate: $date)
                .padding(.horizontal, 20)

            Spacer()
        }
        .background(Color.gray10)
        .setNavigationBackButton()
    }
}
