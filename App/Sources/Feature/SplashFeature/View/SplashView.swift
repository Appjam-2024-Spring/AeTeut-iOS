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
                Image("aticon")
            }
    }
}

#Preview {
    SplashView()
}
