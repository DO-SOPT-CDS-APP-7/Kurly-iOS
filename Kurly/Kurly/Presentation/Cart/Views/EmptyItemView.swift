//
//  EmptyItemView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/25.
//

import UIKit

import SnapKit
import Then

class EmptyItemView: BaseView {
    
    private let imageView = UIImageView()
    private let emptyTitleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        imageView.do {
            $0.image = ImageLiterals.Home.icn.errorButton
        }
        
        emptyTitleLabel.do {
            $0.text = "장바구니에 담긴 상품이 없습니다"
            $0.textColor = .gray3
            $0.font = .fontGuide(.body_medium_16)
        }
    }
    
    override func setLayout() {
        self.addSubviews(imageView, emptyTitleLabel)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(emptyTitleLabel.snp.top).inset(-8)
        }
        
        emptyTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
