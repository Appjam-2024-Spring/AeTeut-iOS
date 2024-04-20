import SwiftUI
import DesignSystem

struct ConfirmView: View {
    @State var isNavigatedToSuccess = false
    
    var body: some View {
        VStack(spacing: .zero) {
            VStack(spacing: 8) {
                descriptionView(text: "고인 성함", content: "홍승재")

                descriptionView(text: "발인일", content: "2024년 4월 20일")

                descriptionView(text: "연락처", content: "010 1234 5678")

                descriptionView(text: "연결 장소", content: "대전광역시 유성구 가정북로 76")
            }
            .padding(20)
            
            Spacer()
            
            ATButton(text: "확인", style: .main) {
                isNavigatedToSuccess = true
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton(navigationTitleStyle: .large("부고장에 입력될\n정보를 확인해주세요"))
        .navigate(to: SuccessView(), when: $isNavigatedToSuccess)
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
