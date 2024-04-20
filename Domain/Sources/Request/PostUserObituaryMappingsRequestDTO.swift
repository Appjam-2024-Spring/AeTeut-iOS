//
//  PostUserObituaryMappingsRequestDTO.swift
//  Domain
//
//  Created by 서지완 on 4/21/24.
//

import Foundation

public struct PostUserObituaryMappingsRequestDTO: Encodable {
    let userId: Int
    let obituaryId: Int
}
