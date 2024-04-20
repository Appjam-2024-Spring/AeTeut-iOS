//
//  SplashView.swift
//  AeTeut-iOS
//
//  Created by 서지완 on 4/20/24.
//  Copyright © 2024 com.appjam. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @State var isLaunching: Bool = true
    var body: some View {
            ZStack {
                Color(.black).ignoresSafeArea()
                //Image("ATLogo") // 로고가 제대로 추가된 경우에 해당 이미지의 이름으로 변경
                Text("대충 로고 들어감")
                    .font(.title).bold()
                    .foregroundStyle(.white)
            }
    }
}

#Preview {
    SplashView()
}
