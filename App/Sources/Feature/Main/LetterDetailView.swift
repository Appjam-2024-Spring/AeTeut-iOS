import SwiftUI
import DesignSystem

struct LetterDetailView: View {
    let name: String
    let content: String
    let createdAt: Date
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 4) {
                    Text(name)
                        .atFont(.headLine, color: .gray100)

                    Text("에게")
                        .atFont(.headLine, color: .gray80)

                    Spacer()
                }

                Text(content)
                    .atFont(.subHeadLine, color: .gray100)
                    .multilineTextAlignment(.leading)
            }
            .padding(20)

            Text("\(createdAt.year)년 \(createdAt.month)월 \(createdAt.day)일")
                .atFont(.body, color: .gray60)
                .padding(.vertical, 16)
                .padding(.horizontal, 20)

            Spacer()
        }
        .background(Color.gray10)
        .setNavigationBackButton()
    }
}
