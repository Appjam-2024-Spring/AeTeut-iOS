import Moya

public enum ObituariesAPI {
    case fetchAllObituaries
    case fetchObituariesToID(Int)
    case postObituary(PostObituaryRequestDTO)
}

extension ObituariesAPI: AeteutAPI {

    public var domain: AeTeutDomain {
        .obituaries
    }

    public var urlPath: String {
        switch self {
        case .fetchAllObituaries, .postObituary:
            ""

        case let .fetchObituariesToID(id):
            "/\(id)"
        }
    }

    public var method: Method {
        switch self {
        case .fetchAllObituaries, .fetchObituariesToID:
            return .get

        case .postObituary:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case .fetchAllObituaries, .fetchObituariesToID:
            return .requestPlain

        case let .postObituary(req):
            return .requestJSONEncodable(req)
        }
    }
}
