import SwiftUI
import DesignSystem

struct SetAddressView: View {
    @State var text: String = ""

    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                SearchTextField("발인지를 입력해주세요", text: $text)

                ForEach(["asdf", "asdf"], id: \.self) { value in
                    NavigationLink {
                        ConfirmView()
                    } label: {
                        AddressCell(action: {})
                    }
                }
            }
        }
        .background(Color.gray10)
        .setNavigationBackButton()
    }
}
