
import Foundation

// MARK: - FetchUserResponseDTO
struct FetchUserResponseDTO: Codable {
    let id: Int
    let name, email, createdAt: String
}

struct FetchUserEntity {
    let id: Int
    let name, email, createdAt: String
}

extension FetchUserResponseDTO {
    var toDomain: FetchUserEntity {
        .init(id: id, name: name, email: email, createdAt: createdAt)
    }
}
