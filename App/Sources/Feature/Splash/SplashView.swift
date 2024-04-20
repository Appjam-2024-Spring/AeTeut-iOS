//
//  SplashView.swift
//  AeTeut-iOS
//
//  Created by 서지완 on 4/20/24.
//  Copyright © 2024 com.appjam. All rights reserved.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SplashViewModel = .init()

    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

            Image("aticon")
        }
        .onAppear {
            viewModel.onAppear {
                appState.sceneFlow = .main
            } onError: {
                appState.sceneFlow = .login
            }
        }
    }
}

#Preview {
    SplashView()
}
