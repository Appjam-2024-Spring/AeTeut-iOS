import SwiftUI
import DesignSystem

struct SuccessView: View {
    @State var isNavigatedToSuccess = false
    
    var body: some View {
        VStack(spacing: .zero) {
            ATImage(.obituaryChinease)
                .frame(width: 91.58, height: 61.07)
                .padding(.top, 72)

            Text("訃홍길동님께서 별세하셨기에 삼가 알려드립니다.\n가시는 길 깊은 애도와\n명복을 빌어주시길 진심으로 바랍니다.")
                .atFont(.subHeadLine, color: .gray100)
                .multilineTextAlignment(.center)
                .frame(height: 72)
                .padding(.top, 24)
            
            Rectangle()
                .frame(height: 2)
                .padding(.horizontal, 20)
                .foregroundStyle(Color.gray30)
                .padding(.top, 36)

            VStack(spacing: 8) {
                descriptionView(text: "발인일", content: "2024년 4월 20일")

                descriptionView(text: "연락처", content: "010 1234 5678")
                HStack(spacing: 0) {
                    descriptionView(text: "영결장소", content: "대전광역시 유성구 가정북로 76")
                    Button {
                        "대전광역시 유성구 가정북로 76".copyToClipboard
                    } label: {
                        ATIcon(.copy)
                            .frame(24)
                            .padding(.trailing, 20)
                            .padding(.bottom, 7)
                    }
                }
            }
            .padding(20)
            
            Spacer()
            
            HStack(spacing: 8) {
                ATButton(text: "홈으로 돌아가기", style: .sub, isNoPadding: true) {
                    
                }

                ShareLink(item: URL(string: "www.naver.com")!) {
                    ATButton(text: "공유하기",  style: .main, isNoPadding: true)
                }
                
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
        }
        .background(Color.gray10)
        .setNavigationBar(navigationTitleStyle: .large("부고장이 완성되었습니다"))
    }

    @ViewBuilder
    func descriptionView(text: String, content: String) -> some View {
        HStack(spacing: 8) {
            Text(text)
                .atFont(.body, color: .gray80)
                .frame(width: 64, alignment: .leading)

            Text(content)
                .atFont(.subHeadLine, color: .gray100)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
