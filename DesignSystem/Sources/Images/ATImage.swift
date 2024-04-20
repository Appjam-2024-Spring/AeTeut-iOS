import SwiftUI

public struct ATImage: View {
    public enum Image {
        case aeTeutSplashLogo
        case obituaryChinease
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
        case .aeTeutSplashLogo:
            DesignSystemAsset.Images.aeTeutSplashLogo.swiftUIImage

        case .obituaryChinease:
            DesignSystemAsset.Images.obituaryChinease.swiftUIImage
        }
    }
}
