//
//  CustomNavigationBar.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import Then
import SnapKit

enum NavigationType {
    
    case backCartButton
    case closeButton
    
    var setting: (title: String, backHidden: Bool, closeHidden: Bool, cartHidden: Bool) {
        switch self {
        case .backCartButton:
            return ("[전주 베테랑] 칼국수", false, true, false)
        case .closeButton:
            return ("장바구니", true, false, true)
        }
    }
}

final class CustomNavigationBar: UIView {
    
    var type: NavigationType
    
    private lazy var titleLabel = UILabel()
    private lazy var backButton = UIButton()
    lazy var closeButton = UIButton()
    lazy var cartButton = UIButton()
    
    
    init(type: NavigationType) {
        self.type = type
        super.init(frame: .zero)

        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomNavigationBar {
    
    private func setUI() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.text = type.setting.title
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
            $0.textAlignment = .center
        }
        
        backButton.do {
            $0.setImage(ImageLiterals.navigation.backButton, for: .normal)
            $0.isHidden = type.setting.backHidden
        }
        
        closeButton.do {
            $0.setImage(ImageLiterals.navigation.closeButton, for: .normal)
            $0.isHidden = type.setting.closeHidden
        }
        
        cartButton.do {
            $0.setImage(ImageLiterals.navigation.cartButton, for: .normal)
            $0.isHidden = type.setting.cartHidden
        }
    }
    
    private func setLayout() {
        self.addSubviews(backButton, titleLabel, closeButton, cartButton)
        
        self.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 48 / 812)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(7)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(36)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(9)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(36)
        }
        
        cartButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(36)
        }
    }
}
