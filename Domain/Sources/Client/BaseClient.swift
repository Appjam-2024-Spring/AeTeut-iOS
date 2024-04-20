import Moya
import Foundation
import CombineMoya
import Combine

public class BaseClient<API: AeteutAPI> {
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()

    public init(
        provider: MoyaProvider<API>? = nil
    ) {
        self.provider = provider ?? MoyaProvider(plugins: [MoyaLoggingPlugin()])
    }

    func request<T: Decodable>(_ api: API, dto: T.Type) -> AnyPublisher<T, Error> {
        requestPublisher(api)
            .map(\.data)
            .decode(type: dto, decoder: decoder)
            .eraseToAnyPublisher()
    }
    
    func request(_ api: API) -> AnyPublisher<Void, Error> {
        requestPublisher(api)
            .map { _ in }
            .eraseToAnyPublisher()
    }

    private func requestPublisher(_ api: API) -> AnyPublisher<Response, Error> {
        provider.requestPublisher(api, callbackQueue: .main)
            .retry(2)
            .timeout(45, scheduler: DispatchQueue.main)
            .mapError { _ in DomainError.error }
            .eraseToAnyPublisher()
    }
}

enum DomainError: Error {
    case error
}
