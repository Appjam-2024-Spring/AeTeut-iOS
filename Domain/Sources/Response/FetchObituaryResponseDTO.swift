import Foundation

// MARK: - FetchAllObituariesResponseDTOElement
struct FetchObituaryResponseDTO: Decodable {
    let id: Int
    let mortuaryResponseDto: MortuaryResponseDTO
    let name, phoneNumber, date, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, mortuaryResponseDto, name
        case phoneNumber = "PhoneNumber"
        case date, createdAt
    }
}

// MARK: - MortuaryResponseDto
struct MortuaryResponseDTO: Decodable {
    let id: Int
    let name: String
    let lat, lng: Double
    let createdAt: String
}

// MARK: - FetchAllObituariesEntity
struct FetchObituaryEntity: Equatable {
    let id: Int
    let mortuaryEntity: MortuaryEntity
    let name, phoneNumber, date, createdAt: String
}

// MARK: - MortuaryEntity
struct MortuaryEntity: Equatable {
    let id: Int
    let name: String
    let lat, lng: Double
    let createdAt: String
}

extension FetchObituaryResponseDTO {
    var toDomain: FetchObituaryEntity {
        .init(
            id: id,
            mortuaryEntity: mortuaryResponseDto.toDomain,
            name: name,
            phoneNumber: phoneNumber,
            date: date,
            createdAt: createdAt
        )
    }
}

extension MortuaryResponseDTO {
    var toDomain: MortuaryEntity {
        .init(id: id, name: name, lat: lat, lng: lng, createdAt: createdAt)
    }
}
