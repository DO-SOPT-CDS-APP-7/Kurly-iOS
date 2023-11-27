//
//  CartItemHeaderCollectionReusableView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/22.
//

import UIKit

import SnapKit
import Then

class CartItemHeaderCollectionReusableView: UICollectionReusableView, CollectionSectionViewRegisterDequeueProtocol {
    
    static let identifier: String = className
    
    private let ItemKindImage = UIImageView()
    private let cartItemLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartItemHeaderCollectionReusableView {
    
    private func setUI() {
        self.backgroundColor = .white
        
        ItemKindImage.do {
            $0.image = ImageLiterals.Home.icn.refrigerationButton
        }
        
        cartItemLabel.do {
            $0.text = "냉동 상품"
            $0.font = .fontGuide(.title_semibold_18)
            $0.textColor = .gray6
        }
    }
    
    private func setLayout() {
        self.addSubviews(ItemKindImage, cartItemLabel)
        
        ItemKindImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalTo(cartItemLabel.snp.leading).inset(-6)
        }
        
        cartItemLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
}
