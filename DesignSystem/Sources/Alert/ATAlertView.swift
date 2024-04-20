import SwiftUI

private struct ATAlertView: View {
    private let title: String
    private let content: String
    private let cancelButtonText: String
    private let confirmButtonText: String
    private let dismiss: () -> Void
    private let action: () -> Void

    init(
        title: String,
        content: String,
        cancelButtonText: String,
        confirmButtonText: String,
        dismiss: @escaping () -> Void,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.content = content
        self.cancelButtonText = cancelButtonText
        self.confirmButtonText = confirmButtonText
        self.dismiss = dismiss
        self.action = {
            action()
            dismiss()
        }
    }
    
    var body: some View {
        ZStack {
            // 배경
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .atFont(.headLine, color: .gray100)

                    Text(content)
                        .atFont(.body, color: .gray80)
                }

                HStack(spacing: 12) {
                    AlertButton(style: .cancel(text: cancelButtonText), action: dismiss)

                    AlertButton(style: .confirm(text: confirmButtonText), action: action)
                }
            }
            .padding(20)
            .background(Color.gray20)
            .cornerRadius(8)
            .padding(20)
        }
        .background(ClearBackgroundView())
    }
}


// MARK: - Modifier
public struct ATAlertModifier: ViewModifier {
    
    @Binding var isPresented: Bool
    let title: String
    let content: String
    let cancelButtonText: String
    let confirmButtonText: String
    let action: () -> Void
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $isPresented) {
                ATAlertView(
                    title: title,
                    content: self.content, 
                    cancelButtonText: cancelButtonText,
                    confirmButtonText: confirmButtonText,
                    dismiss: dismiss,
                    action: action)
            }
            .transaction { transaction in
                // 모달 애니메이션 없애기
                transaction.disablesAnimations = true
            }
    }

    private func dismiss() {
        self.isPresented = false
    }
}

// MARK: - View Extension
extension View {
    public func atAlert(
        isPresented:Binding<Bool>,
        title: String,
        content: String,
        cancelButtonText: String,
        confirmButtonText: String,
        action: @escaping () -> Void
    ) -> some View {
        modifier(
            ATAlertModifier(
                isPresented: isPresented,
                title: title,
                content: content,
                cancelButtonText: cancelButtonText,
                confirmButtonText: confirmButtonText,
                action: action
            )
        )
    }
}
