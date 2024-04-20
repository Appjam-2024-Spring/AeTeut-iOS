import Foundation

// MARK: - FetchAllLettersResponseDTOElement
struct FetchLetterResponseDTO: Codable {
    let id: Int
    let toName, content, createdAt: String
}
// MARK: - FetchAllLettersResponseDTOElement
struct FetchLetterEntity: Codable {
    let id: Int
    let toName, content, createdAt: String
}

extension FetchLetterResponseDTO {
    var toDomain: FetchLetterEntity {
        .init(id: id, toName: toName, content: content, createdAt: createdAt)
    }
}
