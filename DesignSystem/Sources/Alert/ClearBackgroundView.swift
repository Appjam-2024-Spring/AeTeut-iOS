import SwiftUI

// MARK: - 얼럿에서 투명한 배경
public struct ClearBackgroundView: UIViewRepresentable {
    
    public func makeUIView(context: Context) -> UIView {
        
        let view = UIClearBackgroundView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}

private final class UIClearBackgroundView: UIView {
    public override func layoutSubviews() {
        guard let parentView = superview?.superview else {
            print("ERROR: Failed to get parent view to make it clear")
            return
        }
        parentView.backgroundColor = .clear
    }
}
