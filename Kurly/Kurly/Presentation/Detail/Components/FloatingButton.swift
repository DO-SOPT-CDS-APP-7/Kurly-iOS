//
//  FloatingButton.swift
//  Kurly
//
//  Created by 김보연 on 11/24/23.
//

import UIKit

import SnapKit
import Then

enum FloatingButtonType {
    case up
    case down
    
    var image: UIImage {
        switch self {
        case .up:
            return ImageLiterals.Home.icn.topFloatingButton
        case .down:
            return ImageLiterals.Home.icn.downFloatingButton
        }
    }
}

final class FloatingButton: UIButton {
    
    var titleType: FloatingButtonType
    
    init(type: FloatingButtonType) {
        self.titleType = type
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FloatingButton {
    
    private func setUI() {
        self.do {
            $0.makeShadow(radius: 7, offset: CGSize(width: 0, height: 0), opacity: 0.18)
            $0.backgroundColor = .white
            $0.setImage(titleType.image, for: .normal)
            $0.layer.cornerRadius = 19
            $0.isUserInteractionEnabled = true
            $0.adjustsImageWhenHighlighted = false
            switch titleType {
            case .down:
                $0.setImage(ImageLiterals.Home.icn.downFloatingButton, for: .normal)
            default:
                $0.setImage(ImageLiterals.Home.icn.topFloatingButton, for: .normal)
            }
        }
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 38 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 38 / 812)
        }
    }
}

