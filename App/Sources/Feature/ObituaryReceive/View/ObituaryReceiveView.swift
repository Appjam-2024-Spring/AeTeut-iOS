//
//  ObituaryReceiveView.swift
//  AeTeut-iOS
//
//  Created by 서지완 on 4/20/24.
//  Copyright © 2024 com.appjam. All rights reserved.
//

import SwiftUI
import DesignSystem

struct ObituaryReceiveView: View {
    @StateObject var viewModel = ObituaryReceiveResponse()
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()
            VStack(spacing: 0) {
                Image("Obituary")
                    .padding(.top, 72)
                Text("訃\(viewModel.name)님께서 별세하셨기에 삼가 알려드립니다.\n가시는 길 깊은 애도와\n명복을 빌어주시길 진심으로 바랍니다.")
                    .atFont(.subHeadLine, color: .gray100)
                    .multilineTextAlignment(.center)
                    .frame(height: 72)
                    .padding(.top, 24)
                
                Rectangle()
                    .frame(height: 2)
                    .padding(.horizontal, 20)
                    .foregroundStyle(Color.gray30)
                    .padding(.top, 36)
                
                information(title: "발인일", descripton: viewModel.day)
                    .padding(.top, 36)
                information(title: "연락처", descripton: viewModel.number)
                HStack(spacing: 0) {
                    information(title: "영결장소", descripton: viewModel.it)
                    Button {
                        #warning("기능추가예정")
                    }label: {
                        Image("copy")
                            .padding(.trailing, 20)
                            .padding(.bottom, 7)
                    }
                }
                
                ZStack {
                    Image("map")
                        .padding(.bottom, 71)
                    Image("mappoint")
                        .padding(.bottom, 120)
                }
                .padding(.top, 40)
                
                ATButton(
                  text: "확인",
                  style: .main
                ) {
                    #warning("Action 내용")
                }
                Spacer()
            }
        }
    }
}

@ViewBuilder
func information(
    title: String,
    descripton: String
) -> some View {
    HStack(spacing: 0) {
        Text(title)
            .frame(width: 64, height: 24, alignment: .leading)
            .atFont(.body, color: .gray80)
            
        
        Text(descripton)
            .padding(.leading, 8)
            .frame(width: 249, height: 24, alignment: .leading)
            .atFont(.subHeadLine, color: .gray100)
    
        Spacer()
    }
    .padding(.leading, 20)
    .padding(.bottom, 8)
}

#Preview {
    ObituaryReceiveView()
}
