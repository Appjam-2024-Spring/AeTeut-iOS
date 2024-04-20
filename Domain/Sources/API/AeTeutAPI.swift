import Foundation
import Moya

public protocol AeteutAPI: TargetType {
    var domain: AeTeutDomain { get }
    var urlPath: String { get }
}

public extension AeteutAPI {
    var baseURL: URL {
        URL(
            string: Bundle.main.object(forInfoDictionaryKey: "172.16.20.117") as? String ?? ""
        ) ?? URL(string: "https://www.google.com")!
    }

    var path: String {
        domain.asURLString + urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}

public enum AeTeutDomain: String {
    case obituaries
    case letter
    case userobituarymappings
}

extension AeTeutDomain {
    var asURLString: String {
        "/\(self.rawValue)"
    }
}
