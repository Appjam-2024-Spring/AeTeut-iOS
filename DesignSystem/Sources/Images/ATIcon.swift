import SwiftUI

public struct ATIcon: View {
    public enum Image {
        case arrowBack
        case copy
        case appleLogo
        case kakaoLogo
        case send
        case arrowDown
        case add
        case search
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        atToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func atToImage() -> SwiftUI.Image {
        switch image {
        case .arrowBack:
            DesignSystemAsset.Icons.arrowBack.swiftUIImage

        case .copy:
            DesignSystemAsset.Icons.copy.swiftUIImage

        case .kakaoLogo:
            DesignSystemAsset.Icons.kakaoLogo.swiftUIImage

        case .appleLogo:
            DesignSystemAsset.Icons.appleLogo.swiftUIImage

        case .send:
            DesignSystemAsset.Icons.send.swiftUIImage

        case .arrowDown:
            DesignSystemAsset.Icons.arrowDown.swiftUIImage

        case .add:
            DesignSystemAsset.Icons.add.swiftUIImage

        case .search:
            DesignSystemAsset.Icons.search.swiftUIImage
        }
    }
}
