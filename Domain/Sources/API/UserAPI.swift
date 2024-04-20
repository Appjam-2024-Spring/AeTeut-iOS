import Moya

public enum UserAPI {
    case fetchAllUser
    case fetchUserToID(Int)
    case fetchUserObituaries(Int)
    case fetchUserWritingLetter(Int)
    case postUserSignUpLogIn(PostUserSignUpLogInRequestDTO)
}

extension UserAPI: AeteutAPI {
    
    public var domain: AeTeutDomain {
        .user
    }
    
    public var urlPath: String {
        switch self {
        case .fetchAllUser, .postUserSignUpLogIn:
            return ""
            
        case let .fetchUserToID(id):
            return "/\(id)"
            
        case let .fetchUserObituaries(id):
            return "/\(id)/obituaries"
            
        case let .fetchUserWritingLetter(id):
            return "/\(id)/letters"
        }
    }
    
    public var method: Method {
        switch self {
        case .fetchAllUser, .fetchUserToID, .fetchUserObituaries, .fetchUserWritingLetter:
            return .get
            
        case .postUserSignUpLogIn:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .fetchAllUser, .fetchUserToID, .fetchUserObituaries, .fetchUserWritingLetter:
            return .requestPlain
            
        case let .postUserSignUpLogIn(req):
            return .requestJSONEncodable(req)
        }
    }
}
