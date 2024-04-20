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
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 6) {
                if isLaunching {
                    SplashView()
                        .animation(.easeInOut(duration: 0.5))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                isLaunching = false
                            }
                        }
                } else {
                    Image("aticon")
                        .padding(.top, 278)
                        .padding(.bottom, 288)
                    Button {
                        appleLoginState.toggle()
                    }label: {
                        Image("AppleLogin")
                        
                    }
                    
                    Button {
                        kakaoLoginState.toggle()
                    }label: {
                        Image("KakaoLogin")
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
