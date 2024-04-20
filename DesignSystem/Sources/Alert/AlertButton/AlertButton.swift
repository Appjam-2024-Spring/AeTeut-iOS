import SwiftUI

struct AlertButton: View {
    let style: AlertButtonStyle.Style
    let text: String
    let action: () -> Void

    init(
        style: AlertButtonStyle.Style,
        action: @escaping () -> Void = {}
    ) {
        switch style {
        case let .confirm(text),
            let .cancel(text):
            self.text = text
        }
        self.style = style
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Text(text)
                .multilineTextAlignment(.center)
        }
        .alertButtonStyle(style)
    }
}
