import Moya
import Combine
import CombineMoya

public final class UserObituaryMappingsClient: BaseClient<UserObituaryMappingsAPI> {
    func postUserObituaryMappings(req: PostUserObituaryMappingsRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postUserObituaryMappings(req))
            .eraseToAnyPublisher()
    }
}
