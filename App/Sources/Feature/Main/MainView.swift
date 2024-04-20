import SwiftUI
import DesignSystem

struct Rlfhr: Hashable {
    let name: String
    let content: String

    init(_ name: String, _ content: String) {
        self.name = name
        self.content = content
    }
}
struct MainView: View {
    @State var isNavigatedToSendObituaryView = false
    @State var date = Date()
    @State var selection = 0
    
    let rldlfDummy = [
        "홍길동님의 기일"
    ]
    let rlfhrDummy: [Rlfhr] = [
        .init("홍길동", """
                살아계실때 좋은 곳에 한번이라도 모시고 갈걸..
                조금 더 따뜻하게 얘기할걸..
                아프실 때 조금 더 돌봐드릴걸.. 얘기 좀 더 해볼걸..
                엠뷸런스에 실려가실 때 손 한번 잡아봐드릴걸..

                모든게 후회가 됩니다.

                지금쯤 좋은 곳 가셨지요.
                그 곳에서 우리 아빠 만나셨나요?
                부디 좋은 곳에서 큰 스님 되셔서 우리 엄마, 언니 , 해진이, 저, 남편 해진이 그리고 관계 있는 모든 사람 다
                지켜주세요.

                빈자리가 많이 허전하고 그립습니다..
                사랑합니다.
                """)
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: .zero) {
                Text("""
                4월 12일,
                홍길동님의 기일이에요
                """)
                .atFont(.pageTitle, color: .white)
                .multilineTextAlignment(.leading)
                .padding(.top, 40)
                .padding(.bottom, 16)
                
                CalendarView(selectedDate: $date)
                    .padding(.vertical, 16)
                
                Color.gray30
                    .frame(maxWidth: .infinity, maxHeight: 2)
                    .padding(.vertical, 24)
                
                SegmentControl(
                    selectedIndex: $selection,
                    options: ["기일", "기록"]
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(date.month)월 \(date.day)일")
                        .atFont(.description, color: .gray70)
                        .padding(.leading, 4)
                    
                    if selection == 0 {
                        ForEach(rldlfDummy, id: \.self) { value in
                            MemorialDayCell(text: value)
                        }
                    } else {
                        ForEach(rlfhrDummy, id: \.self) { value in
                            NavigationLink {
                                LetterDetailView(name: value.name, content: value.content, createdAt: Date())
                            } label: {
                                LetterCell(name: value.name, content: value.content)
                            }
                        }
                        
                        NavigationLink {
                            WriteLetterView()
                        } label: {
                            AddLetterButton()
                        }
                    }
                }
                .padding(.vertical, 12)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.gray10)
        .setNavigationBar(rightIcon: ( .send, {
            self.isNavigatedToSendObituaryView = true
        }))
        .navigate(to: SetNameView(), when: $isNavigatedToSendObituaryView)
    }
}
