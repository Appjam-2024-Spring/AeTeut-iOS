import SwiftUI
import DesignSystem

struct MemorialDayCell: View {
    let text: String
    var body: some View {
        Text(text)
            .atFont(.subHeadLine, color: .gray90)
            .lineLimit(1)
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
