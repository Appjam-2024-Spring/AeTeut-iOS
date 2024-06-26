import Foundation

public final class AppState: ObservableObject {
    public init(sceneFlow: SceneFlow) {
        self.sceneFlow = sceneFlow
    }

    @Published public var sceneFlow: SceneFlow
}
