import SwiftUI

public enum NavigationTitleStyle {
    case large(String)
    case small(String)
}

public typealias Icons = ATIcon.Image

public struct NavigationBarModifier: ViewModifier {
    @Environment(\.dismiss) private var dismiss
    private let navigationTitleStyle: NavigationTitleStyle?

    private let hasBackButton: Bool
    private let rightIcon: (icon: Icons, action: () -> Void)?

    init(
        navigationTitleStyle: NavigationTitleStyle?,
        hasBackButton: Bool = false,
        rightIcon: (Icons, () -> Void)? = nil
    ) {
        self.navigationTitleStyle = navigationTitleStyle
        self.hasBackButton = hasBackButton
        self.rightIcon = rightIcon
    }

    public func body(content: Content) -> some View {
        VStack(spacing: .zero) {
            ZStack(alignment: .topLeading) {
                HStack {
                    if hasBackButton {
                        Button {
                            dismiss()
                        } label: {
                            ATIcon(.arrowBack)
                                .frame(28)
                                .padding(.vertical, 6)
                                .padding(.trailing, 12)
                        }
                    }

                    Spacer()

                    if let rightIcon {
                        Button(action: rightIcon.action) {
                            ATIcon(rightIcon.icon)
                                .frame(28)
                                .padding(6)
                        }
                    }
                }
                .frame(height: 44)
                .padding(.horizontal, 20)

                if let navigationTitleStyle {
                    switch navigationTitleStyle {
                    case let .large(text):
                        Text(text)
                            .atFont(.pageTitle, color: .gray100)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16)
                            .padding(.top, 48)
                            .padding(.top, 44) // Navigation Bar Height
                    case let .small(text):
                        Text(text)
                            .atFont(.subHeadLine, color: .gray100)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .background(Color.gray10.ignoresSafeArea(edges: .top))

            content
                .frame(maxHeight: .infinity)
        }
    }
}

public extension View {
    func setNavigationBar(
        navigationTitleStyle: NavigationTitleStyle? = nil,
        hasBackButton: Bool = false,
        rightIcon: (Icons, () -> Void)? = nil
    ) -> some View {
        modifier(
            NavigationBarModifier(
                navigationTitleStyle: navigationTitleStyle,
                hasBackButton: hasBackButton,
                rightIcon: rightIcon
            )
        )
    }

    func setNavigationBackButton(
        navigationTitleStyle: NavigationTitleStyle? = nil
    ) -> some View {
        modifier(
            NavigationBarModifier(
                navigationTitleStyle: navigationTitleStyle,
                hasBackButton: true
            )
        )
    }
}

// SwipeGesture로 뒤로갈 수 있게 하는 extension
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

#Preview(body: {
    NavigationView {
        VStack {}
            .setNavigationBackButton(navigationTitleStyle: .small("갱갱갱"))
    }
})
