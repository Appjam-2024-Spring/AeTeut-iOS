//
//  AlertTestView.swift
//  DesignSystem
//
//  Created by 홍승재 on 4/20/24.
//

import SwiftUI

struct AlertDemoView: View {
    @State var isPressed = false

    init() {
        DesignSystemFontFamily.registerAllCustomFonts()
    }

    var body: some View {
        Button {
            isPressed.toggle()
        } label: {
            Text("Toggle")
        }
        .atAlert(
            isPresented: $isPressed,
            title: "기일을 저장하시겠습니까?",
            content: "기일을 저장하면\n애뜻에서 기일을 알려드립니다.",
            cancelButtonText: "저장하지 않기",
            confirmButtonText: "저장"
        ) {
            print("asdf")
        }
    }
}

#Preview {
    AlertDemoView()
}
