import SwiftUI
import DesignSystem
struct MainView: View {
    @State var date = Date()
    @State var selection = 0
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("""
            4월 12일,
            홍승재님의 기일이에요
            """)
            .atFont(.pageTitle, color: .white)
            .multilineTextAlignment(.leading)
            .padding(.top, 40)
            .padding(.bottom, 16)

            CalendarView(selectedDate: $date)
                .padding(.vertical, 16)

            Color.gray30
                .frame(maxWidth: .infinity, maxHeight: 1)
                .padding(.vertical, 24)

            SegmentControl(
                selectedIndex: $selection,
                options: ["기일", "기록"]
            )

            VStack(alignment: .leading, spacing: 8) {
                Text("\(date.month)월 \(date.day)일")
                    .atFont(.description, color: .gray70)
                    .padding(.leading, 4)

                ScrollView {
                    if selection == 0 {
                        ForEach(["asdfad", "asdafda"], id: \.self) { value in
                            MemorialDayCell(text: value)
                        }
                    } else {
                        ForEach(["asdfad", "asdafda"], id: \.self) { value in
                            NavigationLink {
                                DiaryDetailView(name: value, content: value, createdAt: Date())
                            } label: {
                                DiaryCell(name: value, content: value)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 12)
        }
        .padding(.horizontal, 20)
        .background(Color.gray10)
        .setNavigationBar(rightIcon: ( .send, {
            // navigation
        }))
    }
}
