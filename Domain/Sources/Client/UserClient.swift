import Moya
import Combine
import CombineMoya

public final class UserClient: BaseClient<UserAPI> {
    func fetchAllUser() -> AnyPublisher<[FetchUserEntity], Error> {
        request(.fetchAllUser, dto: [FetchUserResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func fetchUserToID(id: Int) -> AnyPublisher<FetchUserEntity, Error> {
        request(.fetchUserToID(id), dto: FetchUserResponseDTO.self)
            .map(\.toDomain)
            .eraseToAnyPublisher()
    }

    func fetchUserObituaries(id: Int) -> AnyPublisher<[FetchObituaryEntity], Error> {
        request(.fetchUserObituaries(id), dto: [FetchObituaryResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func fetchUserWritingLetter(id: Int) -> AnyPublisher<[FetchLetterEntity], Error> {
        request(.fetchUserWritingLetter(id), dto: [FetchLetterResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func postUserSignUpLogIn(req: PostUserSignUpLogInRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postUserSignUpLogIn(req))
            .eraseToAnyPublisher()
    }
}
