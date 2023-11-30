//
//  FirstSectionCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class FirstSectionCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "FirstSectionCollectionViewCell"
    
    private let imageView = UIImageView()
    private let deliveryLabel = UILabel()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let salePercentLabel = UILabel()
    private let salePriceLabel = UILabel()
    private let priceAndIconStackView = UIStackView()
    private let priceLabel = UILabel()
    private let helpButton = UIButton()
    private let shareButton = UIButton()
    private let originLabel = UILabel()
    private let loginGuideLabel = UILabel()
    private let eventBoxView = UIView()
    private let eventPriceLabel = UILabel()
    private let eventTextLabel = UILabel()
    private let moveToEventImageView = UIImageView()
    private let divider = UIView()
    
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
        
        imageView.do {
            $0.image = ImageLiterals.Home.img.large
        }
        
        deliveryLabel.do {
            $0.font = .fontGuide(.body_regular_13)
            $0.textColor = .gray5
        }
        
        nameLabel.do {
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
        
        descriptionLabel.do {
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray3
        }
        
        salePercentLabel.do {
            $0.font = .fontGuide(.title_bold_25)
            $0.textColor = .orange
        }
        
        salePriceLabel.do {
            $0.font = .fontGuide(.title_bold_25)
            $0.textColor = .gray6
        }
        
        priceAndIconStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        priceLabel.do {
            $0.font = .fontGuide(.body_regular_15)
            $0.textColor = .gray3
        }
        
        helpButton.do {
            $0.setImage(ImageLiterals.Home.icn.helpButton, for: .normal)
        }
        
        shareButton.do {
            $0.setImage(ImageLiterals.Home.icn.shareButton, for: .normal)
        }
        
        originLabel.do {
            $0.text = "원산지: 상품설명/상세정보 참조"
            $0.font = .fontGuide(.title_semibold_18)
            $0.textColor = .gray6
        }
        
        loginGuideLabel.do {
            $0.text = "로그인 후, 적립 혜택이 제공됩니다."
            $0.font = .fontGuide(.title_regular_14)
            $0.textColor = .kuPurple
        }
        
        eventBoxView.do {
            $0.backgroundColor = .purple4
            $0.makeCornerRound(radius: 7)
        }
        
        eventPriceLabel.do {
            $0.text = "2,000원"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .kuPurple
        }
        
        eventTextLabel.do {
            $0.text = "적립금 + 할인 쿠폰 받고 구매하기"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        moveToEventImageView.do {
            $0.image = ImageLiterals.Home.icn.shortcutButtonBlack
        }
        
        divider.do {
            $0.backgroundColor = .gray2
        }
    }
    
    private func setLayout() {
        self.addSubviews(imageView, deliveryLabel, nameLabel, descriptionLabel, salePercentLabel, salePriceLabel, priceAndIconStackView, shareButton, originLabel, loginGuideLabel, eventBoxView, divider)
        priceAndIconStackView.addArrangedSubviews(priceLabel, helpButton)
        eventBoxView.addSubviews(eventPriceLabel, eventTextLabel, moveToEventImageView)
        
        imageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 489 / 812)
        }
        
        deliveryLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().inset(16)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryLabel.snp.bottom).offset(6)
            $0.leading.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().inset(16)
        }
        
        salePercentLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        salePriceLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(salePercentLabel.snp.trailing).offset(6)
        }
        
        priceAndIconStackView.snp.makeConstraints {
            $0.top.equalTo(salePercentLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().inset(16)
        }
        
        shareButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(33)
            $0.trailing.equalToSuperview().inset(9)
        }
        
        originLabel.snp.makeConstraints {
            $0.top.equalTo(priceAndIconStackView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        loginGuideLabel.snp.makeConstraints {
            $0.top.equalTo(originLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().inset(16)
        }
        
        eventBoxView.snp.makeConstraints {
            $0.top.equalTo(loginGuideLabel.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 38 / 812)
        }
        
        eventPriceLabel.snp.makeConstraints {
            $0.top.equalTo(eventBoxView.snp.top).offset(10)
            $0.leading.equalToSuperview().inset(14)
        }
        
        eventTextLabel.snp.makeConstraints {
            $0.top.equalTo(eventBoxView.snp.top).offset(10)
            $0.leading.equalTo(eventPriceLabel.snp.trailing).offset(3)
        }
        
        moveToEventImageView.snp.makeConstraints {
            $0.top.equalTo(eventBoxView.snp.top).offset(8)
            $0.trailing.equalToSuperview().offset(14)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(eventBoxView.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}

extension FirstSectionCollectionViewCell {
    func bindModel(model: DetailProduct) {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let discountRate: String = numberFormatter.string(for: model.discountRate) ?? "0"
        let salePrice: String = numberFormatter.string(for: model.salePrice) ?? "0"
        let price: String = numberFormatter.string(for: model.price) ?? "0"
        Task {
            let image = try await KingfisherService.fetchImage(with: model.image)
            self.imageView.image = image
                }
        self.deliveryLabel.text = model.delivery
        self.nameLabel.text = model.name
        self.descriptionLabel.text = model.description
        self.salePercentLabel.text = "\(discountRate)%"
        self.salePriceLabel.text = "\(salePrice)원"
        self.priceLabel.text = "\(price)원"
        self.priceLabel.attributedText = priceLabel.text?.strikeThrough()
    }
}
