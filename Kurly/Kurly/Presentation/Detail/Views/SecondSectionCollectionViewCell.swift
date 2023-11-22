//
//  SecondSectionCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/22/23.
//

import UIKit

import SnapKit
import Then

class SecondSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SecondSectionCollectionViewCell"
    
    private let deliveryMethodLabel = UILabel()
    private let sellerLabel = UILabel()
    private let deliveryTypeLabel = UILabel()
    private let deliveryDescriptionFirstLineLabel = UILabel()
    private let deliveryDescriptionSecondLineLabel = UILabel()
    private let sellerNameLabel = UILabel()
    private let thickDivider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        basicSetup()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func basicSetup() {
        self.backgroundColor = .white
    }
    
    private func setUI() {
        deliveryMethodLabel.do {
            $0.text = "배송"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        sellerLabel.do {
            $0.text = "판매자"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        deliveryTypeLabel.do {
            $0.text = "샛별배송"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        deliveryDescriptionFirstLineLabel.do {
            $0.text = "23시 전 주문 시 내일 아침 7시 전 도착"
            $0.font = .fontGuide(.body_regular_13)
            $0.textColor = .gray5
        }
        
        deliveryDescriptionSecondLineLabel.do {
            $0.text = "(대구·부산·울산 샛별배송 운영시간 별도 확인)"
            $0.font = .fontGuide(.body_regular_13)
            $0.textColor = .gray5
        }
        
        sellerNameLabel.do {
            $0.text = "컬리"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        thickDivider.do {
            $0.backgroundColor = .gray2
        }
    }
    
    private func setLayout() {
        self.addSubviews(deliveryMethodLabel, sellerLabel, deliveryTypeLabel, deliveryDescriptionFirstLineLabel, deliveryDescriptionSecondLineLabel, sellerNameLabel, thickDivider)
        
        deliveryMethodLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.leading.equalToSuperview().inset(16)
        }
        
        sellerLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryMethodLabel.snp.bottom).offset(45)
            $0.leading.equalToSuperview().inset(16)
        }
        
        deliveryTypeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.leading.equalTo(deliveryMethodLabel.snp.trailing).offset(60)
        }
        
        deliveryDescriptionFirstLineLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.leading.equalToSuperview().inset(101)
        }
        
        deliveryDescriptionSecondLineLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryDescriptionFirstLineLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(101)
        }
        
        sellerNameLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryDescriptionSecondLineLabel.snp.bottom).offset(5)
            $0.leading.equalTo(sellerLabel.snp.trailing).offset(48)
        }
        
        thickDivider.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
}
