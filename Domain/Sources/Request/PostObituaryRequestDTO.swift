import Foundation

// MARK: - FetchAllObituariesResponseDTO
public struct PostObituaryRequestDTO: Encodable {
    let mortuary: MortuaryRequestDTO
    let userID: Int
    let name, phoneNumber, date: String

    enum CodingKeys: String, CodingKey {
        case mortuary
        case userID = "userId"
        case name, phoneNumber, date
    }
}

// MARK: - Mortuary
public struct MortuaryRequestDTO: Encodable {
    let name: String
    let lat, lng: Double
}
