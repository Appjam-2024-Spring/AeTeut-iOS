import Moya

public enum UserAPI {
    case fetchAllUser
    case fetchUserToID(Int)
    case getUserObituaries(Int)
    case UserWritingLetter(Int)
    case postUserSignUpLogIn(PostLetterRequestDTO)
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
            
        case let .getUserObituaries(id):
            return "/\(id)/obituaries"
            
        case let .UserWritingLetter(id):
            return "/\(id)/letters"
        }
    }
    
    public var method: Method {
        switch self {
        case .fetchAllUser, .fetchUserToID, .getUserObituaries, .UserWritingLetter:
            return .get
            
        case .postUserSignUpLogIn:
            return .post
        }
    }
    
    public var task: Task {
        switch self {
        case .fetchAllUser, .fetchUserToID, .getUserObituaries, .UserWritingLetter:
            return .requestPlain
            
        case let .postUserSignUpLogIn(req):
            return .requestJSONEncodable(req)
        }
    }
}
