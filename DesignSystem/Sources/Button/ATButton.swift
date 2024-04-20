import SwiftUI

public struct ATButton: View {
    let text: String
    let style: ATButtonStyle.Style
    let action: () -> Void

    public init(
        text: String,
        style: ATButtonStyle.Style = .main,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
                .multilineTextAlignment(.center)
        }
        .atStyle(style)
    }
}
