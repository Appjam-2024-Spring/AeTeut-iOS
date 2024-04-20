import SwiftUI
import DesignSystem

struct SetAddressView: View {
    @State var text: String = ""
    @State var isShow = false

    var body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                SearchTextField("발인지를 입력해주세요", text: $text) {
                    isShow = true
                }

                if isShow {
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
