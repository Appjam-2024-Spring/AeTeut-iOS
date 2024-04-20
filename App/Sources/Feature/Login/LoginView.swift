//
//  LoginView.swift
//  AeTeut-iOS
//
//  Created by 서지완 on 4/20/24.
//  Copyright © 2024 com.appjam. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State var isLaunching: Bool = true
    @State var appleLoginState: Bool = false
    @State var kakaoLoginState: Bool = false
    var body: some View {
        VStack {
            Image("aticon")
                .padding(.top, 278)
                .padding(.bottom, 288)

            Spacer()

            Button {
                appleLoginState.toggle()
            } label: {
                Image("AppleLogin")
            }
            
            Button {
                kakaoLoginState.toggle()
            } label: {
                Image("KakaoLogin")
            }
        }
        .background(Color(.black).ignoresSafeArea())
    }
}

#Preview {
    LoginView()
}
