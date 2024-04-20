import Moya

public enum UserObituaryMappingsAPI {
    case postUserObituaryMappings(PostUserObituaryMappingsRequestDTO)
}

extension UserObituaryMappingsAPI: AeteutAPI {

    public var domain: AeTeutDomain {
        .userObituaryMappings
    }

    public var urlPath: String {
        switch self {
        case .postUserObituaryMappings:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .postUserObituaryMappings:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .postUserObituaryMappings(req):
            return .requestJSONEncodable(req)
        }
    }
}
