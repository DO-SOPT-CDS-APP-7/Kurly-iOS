//
//  DetailBottomBarView.swift
//  Kurly
//
//  Created by 김보연 on 11/24/23.
//

import UIKit

import SnapKit
import Then

final class DetailBottomBarView: UIView {
    
    let bottomDibsButton = BottomDibsButton()
    let bottomCTAButton = BottomCTAButton(type: .buy)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailBottomBarView {
    
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubviews(bottomDibsButton, bottomCTAButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 108 / 812)
        }
        
        bottomDibsButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(13)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-11)
        }
        
        bottomCTAButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(73)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-11)
        }
    }
}
