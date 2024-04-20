import SwiftUI
import DesignSystem

struct DiaryCell: View {
    let name: String
    let content: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(name + "에게,")
                .atFont(.subHeadLine, color: .gray90)
                .lineLimit(1)
            
            Text(content)
                .atFont(.description, color: .gray60)
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
