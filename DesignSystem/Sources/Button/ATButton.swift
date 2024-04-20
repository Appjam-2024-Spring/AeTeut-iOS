import SwiftUI

public struct ATButton: View {
    let text: String
    let style: ATButtonStyle.Style
    let isNoPadding: Bool
    let action: () -> Void

    public init(
        text: String,
        style: ATButtonStyle.Style = .main,
        isNoPadding: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.isNoPadding = isNoPadding
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            Text(text)
                .multilineTextAlignment(.center)
        }
        .atStyle(style)
        .padding(.vertical, isNoPadding ? 0 : 12)
        .padding(.horizontal, isNoPadding ? 0 : 20)
    }
}
