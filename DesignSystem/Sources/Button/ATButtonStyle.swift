import SwiftUI


// MARK: - Usage
extension Button {
    func atStyle(_ style: ATButtonStyle.Style) -> some View {
        self.buttonStyle(ATButtonStyle(style: style))
    }
}

public struct ATButtonStyle: ButtonStyle {
    public enum Style {
        case main
        case sub
    }

    let style: Style

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .atFont(.subHeadLine, color: style.foregroundColor)
            .padding(.vertical, 16)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? style.pressedBackgroundColor : style.backgroundColor)
            .cornerRadius(8)
    }
}

// Button Colors
private extension ATButtonStyle.Style {
    var foregroundColor: Color {
        switch self {
        case .main:
            Color.gray10
        case .sub:
            Color.gray100
        }
    }

    var backgroundColor: Color {
        switch self {
        case .main:
            Color.gray100
        case .sub:
            Color.gray30
        }
    }

    var pressedBackgroundColor: Color {
        switch self {
        case .main:
            Color.gray80
        case .sub:
            Color.gray40
        }
    }
}
