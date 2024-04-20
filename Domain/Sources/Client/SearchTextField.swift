import SwiftUI

public struct ATTextField: View {
    let title: String?
    let placeholder: String
    @Binding var text: String
    var onCommit: () -> Void
    @FocusState var isFocused: Bool

    public init(
        _ placeholder: String,
        title: String? = nil,
        text: Binding<String>,
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeholder = placeholder
        self.title = title
        _text = text
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title {
                Text(title)
                    .atFont(.subBody, color: .gray90)
                    .padding(.leading, 4)
            }

            ZStack(alignment: .leading) {
                Text(placeholder)
                    .atFont(.body, color: .gray50)
                    .opacity(text.isEmpty ? 1 : 0)
                    .onTapGesture {
                        isFocused = true
                    }

                TextField("", text: $text)
                    .atFont(.body, color: .gray10)
                    .focused($isFocused)
                    .onSubmit(onCommit)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            .background(Color.gray20)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(
                        isFocused ? Color.gray50 : Color.gray30,
                        lineWidth: 1
                    )
            }
            .animation(.easeIn(duration: 0.2), value: isFocused)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 20)
        .background(Color.gray10)
    }
}

struct ATTextField_Previews: PreviewProvider {
    static var previews: some View {
        ATTextField("Placeholder", title: "타이틀", text: .constant("")) {

        }
    }
}
