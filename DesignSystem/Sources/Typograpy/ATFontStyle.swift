import SwiftUI

protocol ATFontable {
    var font: Font { get }
    var weight: ATFontWeight { get }
    var height: CGFloat { get }
}

enum ATFontWeight {
    case semiBold
    case regular
    case medium

    var pretendardFont: DesignSystemFontConvertible {
        switch self {
        case .semiBold:
            DesignSystemFontFamily.Pretendard.semiBold

        case .regular:
            DesignSystemFontFamily.Pretendard.regular

        case .medium:
            DesignSystemFontFamily.Pretendard.medium
        }
    }
}

public enum ATFontStyle: Hashable {
    case pageTitle
    case headLine
    case subHeadLine
    case body
    case subBody
    case description
    case caption

    var size: CGFloat {
        switch self {
        case .pageTitle:
            28
        case .headLine:
            18
        case .subHeadLine, .body:
            16
        case .subBody, .description:
            14
        case .caption:
            12
        }
    }

    var height: CGFloat {
        switch self {
        case .pageTitle:
            44
        case .headLine:
            28
        case .subHeadLine, .body:
            24
        case .subBody, .description:
            20
        case .caption:
            16
        }
    }

    var weight: ATFontWeight {
        switch self {
        case .pageTitle:
            ATFontWeight.semiBold
        case .headLine, .subHeadLine, .subBody, .caption:
            ATFontWeight.medium
        case .body, .description:
            ATFontWeight.regular
        }
    }
}

// MARK: - FontableSize
extension ATFontable where Self: RawRepresentable, Self.RawValue == CGFloat {
    var size: CGFloat {
        self.rawValue
    }
}
