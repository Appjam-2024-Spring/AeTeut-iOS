import Foundation

// MARK: - FetchAllObituariesResponseDTOElement
struct FetchAllObituariesResponseDTO: Decodable {
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
struct FetchAllObituariesEntity: Equatable {
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

extension FetchAllObituariesResponseDTO {
    var toDomain: FetchAllObituariesEntity {
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

struct Mortuary: Decodable {
    let id: Int
    let name: String
    let lat, lng: Double
    let createdAt: String
}

struct AllUserResponseDTO: Decodable {
    let id: Int
    let name: String
    let email: String
    let createdAt: String
}

struct AllUserEntity: Equatable {
    let id: Int
    let name: String
    let email: String
    let createdAt: String
}

struct IdUserResponseDTO: Decodable {
    let id: Int
    let name: String
    let lat, lng: Double
    let createdAt: String
}

struct IdUserEntity: Equatable {
    let id: Int
    let name: String
    let lat, lng: Double
    let createdAt: String
}

struct UserGetObituariesResponseDTO: Decodable {
    let id: Int
    let mortuary: Mortuary
    let name, phoneNumber, date, createdAt: String

    enum CodingKeys: String, CodingKey {
        case id, mortuary, name
        case phoneNumber = "PhoneNumber"
        case date, createdAt
    }
}

struct UserGetObituariesEntity: Equatable {
    let id: Int
    let mortuaryEntity: MortuaryEntity
    let name, phoneNumber, date, createdAt: String
}

extension UserGetObituariesResponseDTO {
    var toDomain: UserGetObituariesEntity {
        .init(
            id: id,
            mortuary: mortuary.toDomain,
            name: name,
            phoneNumber: phoneNumber,
            date: date,
            createdAt: createdAt
        )
    }
}

struct UserWritingLetterResponseDTO: Decodable {
    let id: Int
    let toName: String
    let content: String
    let createdAt: String
}

struct UserWritingLetterEntity: Equatable {
    let id: Int
    let toName: String
    let content: String
    let createdAt: String
}



