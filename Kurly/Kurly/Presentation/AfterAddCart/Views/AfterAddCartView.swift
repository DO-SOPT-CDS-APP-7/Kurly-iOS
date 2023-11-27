//
//  AfterAddCartView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class AfterAddCartView: BaseView {
    
    private let imageView = UIImageView()
    private let descriptionLabel = UILabel()
    let buyButton = UIButton()
    private let priceLabel = UILabel()
    private let progressView = UIProgressView()
    private let divisionLabel = UILabel()
    
    var relatedCollectionView = CustomCollectionView(type: .withHeader, model: RelatedModel.dummy(), model2: nil)
    
    override func setUI() {
        self.backgroundColor = .white
        
        imageView.do {
            $0.makeCornerRound(radius: 3)
            $0.image = ImageLiterals.addCart.smallCart
        }
        
        descriptionLabel.do {
            $0.text = "장바구니에 상품을 담았습니다."
            $0.font = .fontGuide(.body_regular_15)
            $0.textColor = .black
        }
        
        buyButton.do {
            $0.setTitle("바로구매", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_medium_11)
            $0.backgroundColor = .kuPurple
            $0.makeCornerRound(radius: 4)
        }
        
        priceLabel.do {
            $0.font = .fontGuide(.body_regular_13)
            $0.textColor = .gray5
        }
        
        progressView.do {
            $0.setProgress(0.0, animated: true)
            $0.progressTintColor = .kuPurple
            $0.trackTintColor = .gray2
            $0.makeCornerRound(radius: 5)
        }
        
        divisionLabel.do {
            $0.backgroundColor = .gray2
        }
    }
    
    override func setLayout() {
        self.addSubviews(imageView, descriptionLabel, buyButton, priceLabel, progressView, divisionLabel, relatedCollectionView)
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.centerY)
            $0.leading.equalTo(imageView.snp.trailing).offset(12)
        }
        
        buyButton.snp.makeConstraints {
            $0.centerY.equalTo(imageView.snp.centerY)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(61)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(buyButton.snp.bottom).offset(15)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().dividedBy(1.08)
            $0.height.equalTo(8)
        }
        
        divisionLabel.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        relatedCollectionView.snp.makeConstraints {
            $0.top.equalTo(divisionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(327)
        }
    }
}

extension AfterAddCartView {
    
    func bindPrice(buyPrice: Int) {
        let price: String = (40000 - buyPrice).priceText
        priceLabel.text = "\(price) 더 담으면 무료배송"
        priceLabel.asFontColor(targetString: "\(price)", font: .fontGuide(.body_semibold_13), color: .kuPurple)
        let progress = Float(buyPrice) / 40000
        progressView.setProgress(progress, animated: true)
    }
    
    func bindRelativeFood(model: [RelatedModel]) {
        print("")
    }
}
