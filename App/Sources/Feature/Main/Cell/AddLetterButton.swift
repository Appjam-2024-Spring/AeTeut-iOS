import SwiftUI
import DesignSystem

struct AddLetterButton: View {
    var body: some View {
        HStack(spacing: 4) {
            ATIcon(.add)
                .frame(24)
            Text("기록 추가하기")
                .atFont(.subHeadLine, color: .gray90)
                .lineLimit(1)
        }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray20)
            )
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray30, lineWidth: 1)
            }
    }
}
