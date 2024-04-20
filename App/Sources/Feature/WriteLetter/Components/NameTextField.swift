import SwiftUI
import DesignSystem

struct NameTextField: View {
    @Binding var name: String

    init(_ name: Binding<String>) {
        _name = name
    }
    var body: some View {
        ZStack(alignment: .leading) {
            Text("홍길동")
                .atFont(.body, color: .gray50)
                .opacity(name.isEmpty ? 1 : 0)
            
            TextField("", text: $name)
                .atFont(.body, color: .gray100)
            
            HStack(spacing: 4) {
                Text(name.isEmpty ? "홍길동" : name)
                    .atFont(.body, color: .gray50)
                    .opacity(0.0000001)

                Text("에게")
                    .atFont(.headLine, color: .gray80)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}
