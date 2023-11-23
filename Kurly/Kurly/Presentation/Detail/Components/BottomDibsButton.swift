//
//  BottomDibsButton.swift
//  Kurly
//
//  Created by 김보연 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class BottomDibsButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomDibsButton {
    
    private func setUI() {
        self.do {
            $0.makeBorder(width: 1, color: .gray3)
            $0.backgroundColor = .white
            $0.setImage(ImageLiterals.Home.icn.heartButtonLine, for: .normal)
            $0.layer.cornerRadius = 6
        }
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            $0.width.equalTo(SizeLiterals.Screen.screenWidth * 53 / 375)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
    }
}
