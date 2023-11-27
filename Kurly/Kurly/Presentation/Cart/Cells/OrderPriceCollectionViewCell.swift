//
//  OrderPriceCollectionViewCell.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/23.
//

import UIKit

import SnapKit
import Then

class OrderPriceCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = className

    private var itemPriceLabel = UILabel()
    private var itemDiscountPriceLabel = UILabel()
    private var deliveryPriceLabel = UILabel()
    private var orderPriceLabel = UILabel()
    private var itemPrice = UILabel()
    private var itemDiscountPrice = UILabel()
    private var deliveryPrice = UILabel()
    private var orderPrice = UILabel()
    private let infoLabel = UILabel()
    private let divider = UIView()
    private var leftTitleStackView = UIStackView()
    private var rightPriceStackView = UIStackView()
    private var savePointView = SavePointView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderPriceCollectionViewCell {
    
    private func setUI() {
        self.backgroundColor = .white
        
        itemPriceLabel.do {
            $0.text = "상품금액"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray5
        }
        
        itemDiscountPriceLabel.do {
            $0.text = "상품할인금액"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray5
        }
        
        deliveryPriceLabel.do {
            $0.text = "배송비"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray5
        }
        
        orderPriceLabel.do {
            $0.text = "결제예정금액"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray5
        }
        
        itemPrice.do {
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        itemDiscountPrice.do {
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        deliveryPrice.do {
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        orderPrice.do {
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray6
        }
        
        infoLabel.do {
            $0.text = "쿠폰/적립금은 주문서에서 사용 가능합니다"
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .gray6
        }
        
        divider.do {
            $0.backgroundColor = .gray2
        }
        
        leftTitleStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.alignment = .leading
            $0.spacing = 15
            $0.addArrangedSubviews(itemPriceLabel, itemDiscountPriceLabel, deliveryPriceLabel)
        }
        
        rightPriceStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.alignment = .trailing
            $0.spacing = 14
            $0.addArrangedSubviews(itemPrice, itemDiscountPrice, deliveryPrice)
        }
    }
}

extension OrderPriceCollectionViewCell {
    
    private func setLayout() {
        self.addSubviews(leftTitleStackView, rightPriceStackView, divider, orderPriceLabel, orderPrice, infoLabel, savePointView)
        
        leftTitleStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.leading.equalToSuperview().offset(20)
        }
        
        rightPriceStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(22)
            $0.trailing.equalToSuperview().inset(19)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(leftTitleStackView.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(21)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        orderPriceLabel.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(14)
            $0.left.equalToSuperview().offset(20)
        }
        
        orderPrice.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(17)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(orderPrice.snp.bottom).offset(14)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        savePointView.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 42 / 812)
        }
    }
}

extension OrderPriceCollectionViewCell {
    
    func bindModel(model: OrderModel) {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        self.itemPrice.text = "\(numberFormatter.string(for: model.itemPrice) ?? "0") 원"
        self.itemDiscountPrice.text = model.discountedPrice == 0 ? "\(model.discountedPrice) 원" : "-\(numberFormatter.string(for: model.discountedPrice) ?? "0") 원"
        self.deliveryPrice.text = "\(model.deliveryPrice) 원"
        self.orderPrice.text = "\((model.totalPrice).priceText)"
    }
}
