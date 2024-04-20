//
//  PostLetterRequestDTO.swift
//  Domain
//
//  Created by 서지완 on 4/21/24.
//

import Foundation

public struct PostLetterRequestDTO: Encodable {
    let userId: Int
    let toName: String
    let content: String
}
