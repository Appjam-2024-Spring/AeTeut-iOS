import UIKit

extension String {
    func copyToClipboard(text: String) {
        // UIKit의 UIPasteboard를 사용하여 텍스트를 클립보드에 복사
        UIPasteboard.general.string = text
    }
}
