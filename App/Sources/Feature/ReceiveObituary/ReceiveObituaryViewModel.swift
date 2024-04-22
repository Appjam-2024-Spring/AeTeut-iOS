import SwiftUI

final class ReceiveObituaryViewModel: BaseViewModel {
    @Published var name: String = "홍길동"
    @Published var day: String = "2024년 04월 20일"
    @Published var number: String = "010 1234 5678"
    @Published var it: String = "대전광역시 유성구 가정북로 76"
}
