import SwiftUI
import DesignSystem
import MonthYearWheelPicker

struct CalendarView: View {
    @Binding var selectedDate: Date
    var selectedDateString: String {
        "\(selectedDate.year)년 \(selectedDate.month)월"
    }
    let randomDay = Int.random(in: 1...30)
    @State var columns = Array(repeating: GridItem(.flexible()), count: 7)
    var body: some View {
        VStack(spacing: 4) {
            DatePickerView(selectedDate: $selectedDate, selectedDateString: selectedDateString)

            LazyVGrid(columns: columns, spacing: 4) {
                ForEach(fetchAllDates(), id: \.id) { model in
                    VStack {
                        if model.day != -1 {
                            VStack(spacing: 4) {
                                Text("\(model.day)")
                                    .atFont(.subHeadLine, color: model.date.isSameDay(selectedDate) ? .gray10: .gray100)
                                
                                if model.date.day == randomDay {
                                    Circle()
                                        .fill(model.date.isSameDay(selectedDate) ? Color.gray10: Color.gray100)
                                        .frame(4)
                                }
                            }
                            .background {
                                if model.date.isSameDay(selectedDate) {
                                    Circle()
                                        .fill(Color.gray100)
                                        .frame(48)
                                }
                            }
                            .onTapGesture {
                                withAnimation {
                                    selectedDate = model.date
                                }
                            }
                        }
                    }
                    .frame(height: 48)
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }

    func fetchAllDates() -> [CalendarSheetModel] {
        let calendar = Calendar.current
        var days = selectedDate.fetchAllDatesInCurrentMonth()
            .map { CalendarSheetModel(date: $0, day: $0.day) }
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? .init())
        for _ in 0..<firstWeekday - 1 {
            days.insert(CalendarSheetModel(date: Date(), day: -1), at: 0)
        }
        return days
    }
}
