import SwiftUI
import DesignSystem

struct AddressCell: View {
    let action: () -> Void
    var body: some View {
        HStack(spacing: 24) {
            VStack(alignment: .leading, spacing: 4) {
                Text("대덕소프트웨어마이스터고등학교")
                    .atFont(.body, color: .gray100)

                Text("대전광역시 유성구 가정북로 76")
                    .atFont(.description, color: .gray80)
            }

            Spacer()

            Text("확인")
                .atFont(.subHeadLine, color: .gray100)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
    }
}
