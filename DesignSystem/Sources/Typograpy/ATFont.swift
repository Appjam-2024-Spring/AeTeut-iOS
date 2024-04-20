import SwiftUI

public struct ATFont: ViewModifier {
    public let style: ATFontStyle
    private let lineHeight: CGFloat

    init(style: ATFontStyle) {
        self.style = style
        self.lineHeight = style.weight.pretendardFont.font(size: style.size).lineHeight
    }
    public func body(content: Content) -> some View {
        content
            .font(style.weight.pretendardFont.swiftUIFont(size: style.size))
            .lineSpacing(style.height - lineHeight)
            .padding(.vertical, (style.height - lineHeight) / 2)
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
