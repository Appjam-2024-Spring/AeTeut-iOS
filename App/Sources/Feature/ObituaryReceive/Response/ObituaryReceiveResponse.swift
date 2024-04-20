//
//  ObituaryReceiveResponse.swift
//  AeTeut-iOS
//
//  Created by 서지완 on 4/20/24.
//  Copyright © 2024 com.appjam. All rights reserved.
//

import SwiftUI

class ObituaryReceiveResponse: ObservableObject {
    @Published var name: String = "홍길동"
    @Published var day: String = "2024년 02월 22일"
    @Published var number: String = "010 6286 0063"
    @Published var it: String = "광주광역시 상무대로 312"
}
