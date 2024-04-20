import Moya

public enum LetterAPI {
    case fetchAllLetter
    case fetchLetterToID(Int)
    case postLetter(PostLetterRequestDTO)
}

extension LetterAPI: AeteutAPI {

    public var domain: AeTeutDomain {
        .letter
    }

    public var urlPath: String {
        switch self {
        case .fetchAllLetter, .postLetter:
            ""

        case let .fetchLetterToID(id):
            "/\(id)"
        }
    }

    public var method: Method {
        switch self {
        case .fetchAllLetter, .fetchLetterToID:
            return .get

        case .postLetter:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case .fetchAllLetter, .fetchLetterToID:
            return .requestPlain

        case let .postLetter(req):
            return .requestJSONEncodable(req)
        }
    }
}
