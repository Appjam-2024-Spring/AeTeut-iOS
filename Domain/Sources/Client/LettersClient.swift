import Moya
import Combine
import CombineMoya

public final class LettersClient: BaseClient<LettersAPI> {
    func fetchAllLetter() -> AnyPublisher<[FetchLetterEntity], Error> {
        request(.fetchAllLetter, dto: [FetchLetterResponseDTO].self)
            .map { $0.map(\.toDomain) }
            .eraseToAnyPublisher()
    }

    func fetchLetterToID(id: Int) -> AnyPublisher<FetchLetterEntity, Error> {
        request(.fetchLetterToID(id), dto: FetchLetterResponseDTO.self)
            .map(\.toDomain)
            .eraseToAnyPublisher()
    }

    func postLetter(req: PostLetterRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postLetter(req))
            .eraseToAnyPublisher()
    }
}
