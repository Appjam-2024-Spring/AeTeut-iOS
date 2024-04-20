import SwiftUI


// MARK: - Usage
extension Button {
    func alertButtonStyle(_ style: AlertButtonStyle.Style) -> some View {
        self.buttonStyle(AlertButtonStyle(style: style))
    }
}

struct AlertButtonStyle: ButtonStyle {
    enum Style {
        case confirm(text: String)
        case cancel(text: String)
    }

    let style: Style

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .atFont(.subHeadLine, color: style.foregroundColor)
            .padding(.vertical, 14)
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? style.pressedBackgroundColor : style.backgroundColor)
            .cornerRadius(4)
    }
}

// Button Colors
private extension AlertButtonStyle.Style {
    var foregroundColor: Color {
        switch self {
        case .confirm:
            Color.gray10
        case .cancel:
            Color.gray100
        }
    }

    var backgroundColor: Color {
        switch self {
        case .confirm:
            Color.gray100
        case .cancel:
            Color.gray30
        }
    }

    var pressedBackgroundColor: Color {
        switch self {
        case .confirm:
            Color.gray80
        case .cancel:
            Color.gray40
        }
    }
}
