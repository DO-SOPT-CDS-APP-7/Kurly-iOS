//
//  RelatedCollectionViewCell.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/23/23.
//

import UIKit

import SnapKit
import Then

class RelatedCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = className
    
    private let foodImageView = UIImageView()
    private let putButton = UIButton()
    private let shippingLabel = UILabel()
    private let foodNameLabel = UILabel()
    private let foodPriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RelatedCollectionViewCell {
    
    func setUI() {
        
        foodImageView.do {
            $0.makeCornerRound(radius: 4)
        }
        
        putButton.do {
            $0.backgroundColor = .white
            $0.setTitleColor(.gray6, for: .normal)
            $0.setTitle("담기", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_regular_13)
            $0.setImage(ImageLiterals.Home.icn.cartButton22, for: .normal)
            $0.layer.cornerRadius = 4
            $0.makeBorder(width: 1, color: .gray3)
            $0.contentHorizontalAlignment = .center
        }
    
        shippingLabel.do {
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .gray4
        }
        
        foodNameLabel.do {
            $0.font = .fontGuide(.body_regular_14)
            $0.textColor = .gray6
            $0.numberOfLines = 2
        }
        
        foodPriceLabel.do {
            $0.font = .fontGuide(.body_bold_15)
            $0.textColor = .gray6
        }
    }
    
    func setLayout() {
        self.addSubviews(foodImageView, putButton, shippingLabel, foodNameLabel, foodPriceLabel)
        
        foodImageView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        
        putButton.snp.makeConstraints {
            $0.top.equalTo(foodImageView.snp.bottom).offset(6)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        shippingLabel.snp.makeConstraints {
            $0.top.equalTo(putButton.snp.bottom).offset(6)
            $0.leading.equalToSuperview()
        }
        
        foodNameLabel.snp.makeConstraints {
            $0.top.equalTo(shippingLabel.snp.bottom).offset(3)
            $0.horizontalEdges.equalToSuperview()
        }
        
        foodPriceLabel.snp.makeConstraints {
            $0.top.equalTo(foodNameLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview()
        }
    }
    
    func bindData(model: RelatedModel) {
        
        foodImageView.image = model.image
        shippingLabel.text = model.shipping
        foodNameLabel.text = model.name
        foodPriceLabel.text = model.price.priceText
    }
}
