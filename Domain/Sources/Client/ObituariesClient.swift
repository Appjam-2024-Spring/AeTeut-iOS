import Moya
import Combine
import CombineMoya

public final class ObituariesClient: BaseClient<ObituariesAPI> {
    func fetchAllObituaries() -> AnyPublisher<[FetchAllObituariesEntity], Error> {
        request(.fetchAllObituaries, dto: [FetchAllObituariesResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func fetchObituariesToID(id: Int) -> AnyPublisher<FetchAllObituariesEntity, Error> {
        request(.fetchObituariesToID(id), dto: FetchAllObituariesResponseDTO.self)
            .map(\.toDomain)
            .eraseToAnyPublisher()
    }
}
