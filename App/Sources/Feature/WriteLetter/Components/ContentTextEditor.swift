import SwiftUI
import DesignSystem

struct ContentTextEditor: View {
    @Binding var content: String

    init(_ content: Binding<String>) {
        _content = content
    }
    var body: some View {
        ZStack(alignment: .topLeading) {
            Text("애도를 작성해주세요.")
                .atFont(.subHeadLine, color: .gray50)
                .opacity(content.isEmpty ? 1 : 0)
            
            TextEditor(text: $content)
                .scrollContentBackground(.hidden) // <- Hide it
                .atFont(.subHeadLine, color: .gray100)
                .padding(.top, -7)
                .padding(.leading, -5)
        }
    }
}
