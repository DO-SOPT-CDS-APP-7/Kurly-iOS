//
//  FontLiterals.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import UIKit

enum Pretendard: String {
    case extrabold = "Pretendard-ExtraBold"
    case bold = "Pretendard-Bold"
    case semibold = "Pretendard-SemiBold"
    case medium = "Pretendard-Medium"
    case regular = "Pretendard-Regular"
}

enum FontLevel {
    case title_bold_25
    case title_semibold_23
    case title_extrabold_21
    case title_semibold_20
    case title_semibold_18
    case title_semibold_16
    case body_bold_15
    case body_medium_15
    case body_medium_16
    case body_regular_15
    case body_medium_14
    case body2_medium_14
    case title_regular_14
    case body_regular_14
    case body2_regular_14
    case body_regular_13
    case body_semibold_13
    case body_regular_12
    case caption_small_semibold_11
    case body_medium_11

}

extension FontLevel {
    
    var fontWeight: String {
        switch self {
        case .title_extrabold_21:
            return Pretendard.extrabold.rawValue
        case .body_bold_15, .title_bold_25:
            return Pretendard.bold.rawValue
        case .body_semibold_13, .title_semibold_16, .title_semibold_18, .title_semibold_20, .title_semibold_23, .caption_small_semibold_11:
            return Pretendard.semibold.rawValue
        case .body_medium_11, .body_medium_14, .body_medium_15, .body_medium_16, .body2_medium_14:
            return Pretendard.medium.rawValue
        case .body_regular_12, .body_regular_13, .body_regular_14, .body_regular_15, .body2_regular_14, .title_regular_14:
            return Pretendard.regular.rawValue
        }
    }
    
    var fontSize: CGFloat {
        switch self {
        case .title_bold_25:
            return 25
        case .title_semibold_23:
            return 23
        case .title_extrabold_21:
            return 21
        case .title_semibold_20:
            return 20
        case .title_semibold_18:
            return 18
        case .title_semibold_16, .body_medium_16:
            return 16
        case .body_bold_15, .body_medium_15, .body_regular_15:
            return 15
        case .body_medium_14, .body2_medium_14, .title_regular_14, .body_regular_14, .body2_regular_14:
            return 14
        case .body_semibold_13, .body_regular_13:
            return 13
        case .body_regular_12:
            return 12
        case .body_medium_11, .caption_small_semibold_11:
            return 11
        }
    }
}

extension UIFont {
    
    static func fontGuide(_ fontLevel: FontLevel) -> UIFont {
        return UIFont(name: fontLevel.fontWeight, size: fontLevel.fontSize)!
    }
}
