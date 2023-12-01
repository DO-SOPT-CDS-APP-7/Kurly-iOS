//
//  AddCartView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class AddCartView: BaseView {
    
    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let divisionView = UIView()
    private let orderNameLabel = UILabel()
    private let salePriceLabel = UILabel()
    private let priceLabel = UILabel()
    let stepper = Stepper()
    private let secondDivisionView = UIView()
    private let pointLabel = UILabel()
    private let rewardLabel = UILabel()
    lazy var addCartButton = BottomCTAButton(type: .addCart)

    override func setUI() {
        self.backgroundColor = .white
        
        imageView.do {
            $0.makeCornerRound(radius: 3)
        }
        
        nameLabel.do {
            $0.font = .fontGuide(.title_regular_14)
            $0.textColor = .gray6
        }
        
        descriptionLabel.do {
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .gray4
        }
        
        divisionView.do {
            $0.backgroundColor = .gray2
        }
        
        orderNameLabel.do {
            $0.font = .fontGuide(.title_regular_14)
            $0.textColor = .gray6
        }
        
        salePriceLabel.do {
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
        
        priceLabel.do {
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray4
        }

        secondDivisionView.do {
            $0.backgroundColor = .gray2
        }
        
        pointLabel.do {
            $0.text = "적립"
            $0.font = .fontGuide(.body_medium_11)
            $0.textColor = .white
            $0.textAlignment = .center
            $0.backgroundColor = .yellow
            $0.makeCornerRound(radius: 10)
        }
        
        rewardLabel.do {
            $0.text = "로그인 후, 적립 혜택 제공"
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .gray5
        }
    }
    
    override func setLayout() {
        self.addSubviews(imageView, nameLabel, descriptionLabel, divisionView, orderNameLabel, salePriceLabel, priceLabel, stepper, secondDivisionView, pointLabel, rewardLabel, addCartButton)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(48)
            $0.leading.equalToSuperview().inset(20)
            $0.size.equalTo(50)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(53)
            $0.leading.equalTo(imageView.snp.trailing).offset(14)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel.snp.leading)
        }
        
        divisionView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        orderNameLabel.snp.makeConstraints {
            $0.top.equalTo(divisionView.snp.bottom).offset(18)
            $0.leading.equalTo(imageView.snp.leading)
        }
        
        salePriceLabel.snp.makeConstraints {
            $0.top.equalTo(orderNameLabel.snp.bottom).offset(19)
            $0.leading.equalTo(imageView.snp.leading)
        }
        
        priceLabel.snp.makeConstraints {
            $0.centerY.equalTo(salePriceLabel.snp.centerY)
            $0.leading.equalTo(salePriceLabel.snp.trailing).offset(5)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(orderNameLabel.snp.bottom).offset(11)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        secondDivisionView.snp.makeConstraints {
            $0.top.equalTo(stepper.snp.bottom).offset(14)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(1)
        }
        
        pointLabel.snp.makeConstraints {
            $0.trailing.equalTo(rewardLabel.snp.leading).offset(-6)
            $0.centerY.equalTo(rewardLabel.snp.centerY)
            $0.width.equalTo(30)
            $0.height.equalTo(18)
        }
        
        rewardLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(22)
            $0.top.equalTo(secondDivisionView.snp.bottom).offset(14)
        }
        
        addCartButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(15)
        }
    }
}

extension AddCartView {
    func bindModel(model: Product) {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let salePrice: String = numberFormatter.string(for: model.salePrice) ?? "0"
        let price: String = numberFormatter.string(for: model.price) ?? "0"
        
        Task {
            let image = try await KingfisherService.fetchImage(with: model.image)
            self.imageView.image = image
        }
        self.nameLabel.text = model.name
        self.descriptionLabel.text = model.description
        self.orderNameLabel.text = model.name
        self.salePriceLabel.text = "\(salePrice)원"
        self.priceLabel.text = "\(price)원"
        self.priceLabel.attributedText = priceLabel.text?.strikeThrough()
        bindPrice(salePrice: model.salePrice, price: model.price, value: 1)
    }
    
    func bindPrice(salePrice: Int, price: Int, value: Int) {
        self.addCartButton.setTitle("\((salePrice * value).priceText) 장바구니 담기", for: .normal)
        self.salePriceLabel.text = "\((salePrice * value).priceText)"
        self.priceLabel.text = "\((price * value).priceText)"
    }
    
}
