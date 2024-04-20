import SwiftUI
import DesignSystem

struct DatePickerView: View {
    @Binding var selectedDate: Date
    let selectedDateString: String

    var body: some View {
        HStack(spacing: 4) {
            Text(selectedDateString)
                .atFont(.headLine, color: .white)
            
            ATIcon(.arrowDown)
                .frame(24)
        }
        .padding(.vertical, 4)
        .overlay{
            DatePicker(
                "",
                selection: $selectedDate,
                displayedComponents: [.date]
            )
            .blendMode(.destinationOver)
        }
    }
}
