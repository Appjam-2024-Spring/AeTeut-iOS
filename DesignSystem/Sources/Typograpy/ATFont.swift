import SwiftUI

public struct ATFont: ViewModifier {
    public let style: ATFontStyle

    public func body(content: Content) -> some View {
        content
            .font(style.weight.pretendardFont.swiftUIFont(size: style.size))
            .lineSpacing(20 - style.height)
            .padding(.vertical, (20 - style.height) / 2)
    }
}

public extension View {
    func atFont(_ style: ATFontStyle) -> some View {
        self
            .modifier(ATFont(style: style))
    }

    func atFont(_ style: ATFontStyle, color: Color) -> some View {
        self
            .atFont(style)
            .foregroundColor(color)
    }
}
