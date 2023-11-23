//
//  CartItemCollectionViewCell.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/22.
//

import UIKit

import SnapKit
import Then

final class CartItemCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "CartItemCollectionViewCell"
    
    let selectItemButton = UIButton()
    private let itemLabel = UILabel()
    let deleteItemButton = UIButton()
    private let itemImageView = UIImageView()
    private let itemDiscountPrice = UILabel()
    private let itemPrice = UILabel()
    let stepper = Stepper()
    private let topStackView = UIStackView()
    private let priceStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        selectItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.checkButtonDefault, for: .normal)
            $0.setImage(ImageLiterals.Home.icn.checkButtonPressed, for: .selected)
        }
        
        itemLabel.do {
            $0.text = "[전주 베테랑] 칼국수"
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray6
        }
        
        deleteItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.closeButtonGray, for: .normal)
        }
        
        itemImageView.do {
            $0.image = ImageLiterals.Home.img.large
            $0.sizeToFit()
        }
        
        itemDiscountPrice.do {
            $0.text = "4,720원"
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
        
        itemPrice.do {
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray4
            $0.attributedText = "5,900원".strikeThrough()
        }
        
        topStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 6
            $0.addArrangedSubviews(selectItemButton, itemLabel, deleteItemButton)
            itemLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            selectItemButton.setContentHuggingPriority(.required, for: .horizontal)
            deleteItemButton.setContentHuggingPriority(.required, for: .horizontal)
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 2
            $0.addArrangedSubviews(itemDiscountPrice, itemPrice)
        }
    }
    
    private func setLayout() {
        self.addSubviews(topStackView, itemImageView, priceStackView, stepper)
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(56)
            $0.width.equalTo(60)
            $0.height.equalTo(78)
        }
        
        priceStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(8)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(20)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(priceStackView.snp.bottom).offset(22)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(20)
        }
    }
}
