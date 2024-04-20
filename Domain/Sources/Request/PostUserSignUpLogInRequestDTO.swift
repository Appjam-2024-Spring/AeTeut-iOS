//
//  PostUserSignUpLogInRequestDTO.swift
//  Domain
//
//  Created by 서지완 on 4/21/24.
//

import Foundation

public struct PostUserSignUpLogInRequestDTO: Encodable {
    let name: String
    let email: String
}
