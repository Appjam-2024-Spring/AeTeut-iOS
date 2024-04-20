import SwiftUI
import DesignSystem

struct WriteLetterView: View {
    @Environment(\.dismiss) var dismiss
    @State var name: String = ""
    @State var content: String = ""
    @State var isShowAlert = false
    var body: some View {
        VStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: 10) {
                NameTextField($name)

                ContentTextEditor($content)
            }
            .padding(20)
            
            ATButton(text: "작성 완료", style: .main) {
                isShowAlert = true
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton(navigationTitleStyle: .small("기록 남기기"))
        .atAlert(
            isPresented: $isShowAlert,
            title: "이 글을 기록하시겠습니까?",
            content: """
            \(name)님에게 기록을 남기면,
            애틋에 글이 기록되어 다시 돌아볼 수 있습니다.
            """,
            cancelButtonText: "취소",
            confirmButtonText: "기록하기"
        ) {
            dismiss()
        }
    }
}
