import Moya
import Combine
import CombineMoya

public final class ObituariesClient: BaseClient<ObituariesAPI> {
    func fetchAllObituaries() -> AnyPublisher<[FetchObituaryEntity], Error> {
        request(.fetchAllObituaries, dto: [FetchObituaryResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func fetchObituariesToID(id: Int) -> AnyPublisher<FetchObituaryEntity, Error> {
        request(.fetchObituariesToID(id), dto: FetchObituaryResponseDTO.self)
            .map(\.toDomain)
            .eraseToAnyPublisher()
    }

    func postObituary(req: PostObituaryRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postObituary(req))
            .eraseToAnyPublisher()
    }
}
