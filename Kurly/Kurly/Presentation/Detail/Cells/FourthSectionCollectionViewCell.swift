//
//  FourthSectionCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/23/23.
//

import UIKit

import SnapKit
import Then

class FourthSectionCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "FourthSectionCollectionViewCell"
    
    private let thickDivider = UIView()
    private let productInfoLabel = UILabel()
    private let packagingTypeLabel = UILabel()
    private let saleUnitLabel = UILabel()
    private let productWeightLabel = UILabel()
    private let originLabel = UILabel()
    private let allergyInfoLabel = UILabel()
    private let packagingMethodLabel = UILabel()
    private let deliveryCautionDescriptionLabel = UILabel()
    private let onePackLabel = UILabel()
    private let weightLabel = UILabel()
    private let productDetailInfoLabel = UILabel()
    private let noodleAllergyInfoLabel = UILabel()
    private let sauceAllergyInfoLabel = UILabel()
    private let productTotalAllergyInfoLabel = UILabel()
    private let expirationDateDescriptionLabel = UILabel()
    
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
        
        thickDivider.do {
            $0.backgroundColor = .gray2
        }
        
        productInfoLabel.do {
            $0.text = "상품정보"
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
        
        packagingTypeLabel.do {
            $0.text = "포장타입"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        saleUnitLabel.do {
            $0.text = "판매단위"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        productWeightLabel.do {
            $0.text = "종량/용량"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        originLabel.do {
            $0.text = "원산지"
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray6
        }
        
        allergyInfoLabel.do {
            $0.text = "알레르기정보"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray4
        }
        
        packagingMethodLabel.do {
            $0.text = "냉동 (종이포장)"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        deliveryCautionDescriptionLabel.do {
            $0.text = "택배배송은 에코 포장이 스티로폼으로 대체됩니다."
            $0.font = .fontGuide(.body_regular_13)
            $0.textColor = .gray5
        }
        
        onePackLabel.do {
            $0.text = "1팩"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        weightLabel.do {
            $0.text = "196.5g"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        productDetailInfoLabel.do {
            $0.text = "상품설명/상세정보 참조"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
        }
        
        noodleAllergyInfoLabel.do {
            $0.text = "- 베테랑 칼국수: 밀 함유"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
            $0.partColorChange(targetString: "-", textColor: .gray3)
        }
        
        sauceAllergyInfoLabel.do {
            $0.text = "- 베테랑 맛간장소스: 대두, 밀 함유"
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
            $0.partColorChange(targetString: "-", textColor: .gray3)
        }
        
        productTotalAllergyInfoLabel.do {
            $0.text = "- 이 제품은 메밀, 새우, 달걀, 우유, 땅콩, 고등어, 게, 돼지고기, 소고기, 닭고기, 복숭아, 아황산류, 토마토, 호두, 오징어, 조개류 (굴, 전복, 홍합 포함), 잣을 사용한 제품과 같은 제조 시설에서 제조하고 있습니다."
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
            $0.numberOfLines = 0
            $0.lineBreakMode = .byCharWrapping
            $0.partColorChange(targetString: "-", textColor: .gray3)
        }
        
        expirationDateDescriptionLabel.do {
            $0.text = "유통기한(또는 수령일 포함 최소 165일 이상 남은 제품을 보내 소비기한)정보 드립니다."
            $0.font = .fontGuide(.body_medium_14)
            $0.textColor = .gray6
            $0.numberOfLines = 0
            $0.lineBreakMode = .byCharWrapping
            $0.partColorChange(targetString: "유통기한(또는", textColor: .gray4)
            $0.partColorChange(targetString: "소비기한)정보 드립니다.", textColor: .gray4)
        }
    }
    
    private func setLayout() {
        self.addSubviews(thickDivider, productInfoLabel, packagingTypeLabel, saleUnitLabel, productWeightLabel, originLabel, allergyInfoLabel, packagingMethodLabel, deliveryCautionDescriptionLabel, onePackLabel, weightLabel, productDetailInfoLabel, noodleAllergyInfoLabel, sauceAllergyInfoLabel, productTotalAllergyInfoLabel, expirationDateDescriptionLabel)
        
        thickDivider.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        productInfoLabel.snp.makeConstraints {
            $0.top.equalTo(thickDivider.snp.bottom).offset(25)
            $0.leading.equalToSuperview().inset(16)
        }
        
        packagingTypeLabel.snp.makeConstraints {
            $0.top.equalTo(productInfoLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(16)
        }
        
        saleUnitLabel.snp.makeConstraints {
            $0.top.equalTo(packagingTypeLabel.snp.bottom).offset(32)
            $0.leading.equalToSuperview().inset(16)
        }
        
        productWeightLabel.snp.makeConstraints {
            $0.top.equalTo(saleUnitLabel.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(16)
        }
        
        originLabel.snp.makeConstraints {
            $0.top.equalTo(productWeightLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        
        allergyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(originLabel.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        
        packagingMethodLabel.snp.makeConstraints {
            $0.top.equalTo(thickDivider.snp.bottom).offset(61)
            $0.leading.equalTo(packagingTypeLabel.snp.trailing).offset(36)
        }
        
        deliveryCautionDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(packagingMethodLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().inset(101)
        }
        
        onePackLabel.snp.makeConstraints {
            $0.top.equalTo(deliveryCautionDescriptionLabel.snp.bottom).offset(12)
            $0.leading.equalTo(saleUnitLabel.snp.trailing).offset(36)
        }
        
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(onePackLabel.snp.bottom).offset(11)
            $0.leading.equalTo(productWeightLabel.snp.trailing).offset(31)
        }
        
        productDetailInfoLabel.snp.makeConstraints {
            $0.top.equalTo(weightLabel.snp.bottom).offset(11)
            $0.leading.equalTo(originLabel.snp.trailing).offset(46)
        }
        
        noodleAllergyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(productDetailInfoLabel.snp.bottom).offset(12)
            $0.leading.equalTo(allergyInfoLabel.snp.trailing).offset(12)
        }
        
        sauceAllergyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(noodleAllergyInfoLabel.snp.bottom).offset(1)
            $0.leading.equalToSuperview().offset(101)
        }
        
        productTotalAllergyInfoLabel.snp.makeConstraints {
            $0.top.equalTo(sauceAllergyInfoLabel.snp.bottom).offset(1)
            $0.leading.equalToSuperview().offset(101)
            $0.trailing.equalToSuperview().offset(-16)
        }
        
        expirationDateDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(productTotalAllergyInfoLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
