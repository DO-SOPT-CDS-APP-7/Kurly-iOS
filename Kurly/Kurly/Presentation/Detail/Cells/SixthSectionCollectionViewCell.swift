//
//  SixthSectionCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/23/23.
//

import UIKit

class SixthSectionCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SixthSectionCollectionViewCell"
    
    private let leftDivider = UIView()
    private let kurlyCheckPointHeaderLabel = UILabel()
    private let rightDivider = UIView()
    private let kurlyProcessImageView = UIImageView()
    private let kurlyProcessTitleLabel = UILabel()
    private let kurlyProcessSubTitleLabel = UILabel()
    private let kurlyProcessFirstBodyLabel = UILabel()
    private let kurlyProcessSecondBodyLabel = UILabel()
    private let kurlyProcessThirdBodyLabel = UILabel()
    private let kurlyProcessFourthBodyLabel = UILabel()
    private let kurlyGoodImageView = UIImageView()
    private let kurlyGoodTitleLabel = UILabel()
    private let kurlyGoodSubTitleLabel = UILabel()
    private let kurlyGoodFirstBodyLabel = UILabel()
    private let kurlyGoodSecondBodyLabel = UILabel()
    private let kurlyBrandImageView = UIImageView()
    private let kurlyBrandTitleLabel = UILabel()
    private let kurlyBrandSubTitleLabel = UILabel()
    private let kurlyBrandBodyLabel = UILabel()
    
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
        
        leftDivider.do {
            $0.backgroundColor = .gray3
        }
        
        kurlyCheckPointHeaderLabel.do {
            $0.text = "Kurly’s Check Point"
            $0.font = .fontGuide(.title_extrabold_21)
            $0.textColor = .gray5
        }
        
        rightDivider.do {
            $0.backgroundColor = .gray3
        }
        
        kurlyProcessImageView.do {
            $0.image = ImageLiterals.Home.icn.KuProcess
        }
        
        kurlyProcessTitleLabel.do {
            $0.text = "생산 유통 과정"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray6
        }
        
        kurlyProcessSubTitleLabel.do {
            $0.text = "Process"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        kurlyProcessFirstBodyLabel.do {
            $0.text = "∙ 간장으로 깔끔하게 맛을 낸 국물"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyProcessSecondBodyLabel.do {
            $0.text = "∙ 매장 노하우 그대로 6번 반죽한 둥근 면발"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyProcessThirdBodyLabel.do {
            $0.text = "∙ 국산 통들깨, 가루 배합으로 식감과 풍미 보존"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyProcessFourthBodyLabel.do {
            $0.text = "∙ HACCP인증 시설에서 위생적으로 생산"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyGoodImageView.do {
            $0.image = ImageLiterals.Home.icn.KuGood
        }
        
        kurlyGoodTitleLabel.do {
            $0.text = "활용법"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray6
        }
        
        kurlyGoodSubTitleLabel.do {
            $0.text = "Recommendation"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        kurlyGoodFirstBodyLabel.do {
            $0.text = "∙ 집에서 간편하게 즐기는 유명 맛집의 메뉴"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyGoodSecondBodyLabel.do {
            $0.text = "∙ 밥을 곁들여 한층 더 든든한 한끼로"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
        
        kurlyBrandImageView.do {
            $0.image = ImageLiterals.Home.icn.KuBrand
        }
        
        kurlyBrandTitleLabel.do {
            $0.text = "브랜드와 생산자"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray6
        }
        
        kurlyBrandSubTitleLabel.do {
            $0.text = "Brand & Artisan"
            $0.font = .fontGuide(.body_medium_16)
            $0.textColor = .gray6
        }
        
        kurlyBrandBodyLabel.do {
            $0.text = "∙ 전주 식도락 여행의 필수 코스, 베테랑"
            $0.font = .fontGuide(.body2_regular_14)
            $0.textColor = .gray5
            $0.partColorChange(targetString: "∙", textColor: .gray4)
        }
    }
    
    private func setLayout() {
        self.addSubviews(leftDivider, kurlyCheckPointHeaderLabel, rightDivider, kurlyProcessImageView, kurlyProcessTitleLabel, kurlyProcessSubTitleLabel, kurlyProcessFirstBodyLabel, kurlyProcessSecondBodyLabel, kurlyProcessThirdBodyLabel, kurlyProcessFourthBodyLabel, kurlyGoodImageView, kurlyGoodTitleLabel, kurlyGoodSubTitleLabel, kurlyGoodFirstBodyLabel, kurlyGoodSecondBodyLabel, kurlyBrandImageView, kurlyBrandTitleLabel, kurlyBrandSubTitleLabel, kurlyBrandBodyLabel)
        
        leftDivider.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.equalToSuperview().inset(16)
            $0.width.equalTo(65)
            $0.height.equalTo(1)
        }
        
        kurlyCheckPointHeaderLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        rightDivider.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(65)
            $0.height.equalTo(1)
        }
        
        kurlyProcessImageView.snp.makeConstraints {
            $0.top.equalTo(leftDivider.snp.bottom).offset(61)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyProcessTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyCheckPointHeaderLabel.snp.bottom).offset(60)
            $0.leading.equalTo(kurlyProcessImageView.snp.trailing).offset(4)
        }
        
        kurlyProcessSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyCheckPointHeaderLabel.snp.bottom).offset(64)
            $0.leading.equalTo(kurlyProcessTitleLabel.snp.trailing).offset(2)
        }
        
        kurlyProcessFirstBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessImageView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyProcessSecondBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessFirstBodyLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyProcessThirdBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessSecondBodyLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyProcessFourthBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessThirdBodyLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyGoodImageView.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessFourthBodyLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyGoodTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessFourthBodyLabel.snp.bottom).offset(38)
            $0.leading.equalTo(kurlyProcessImageView.snp.trailing).offset(5)
        }
        
        kurlyGoodSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyProcessFourthBodyLabel.snp.bottom).offset(42)
            $0.leading.equalTo(kurlyGoodTitleLabel.snp.trailing).offset(2)
        }
        
        kurlyGoodFirstBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyGoodImageView.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyGoodSecondBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyGoodFirstBodyLabel.snp.bottom).offset(3)
            $0.leading.equalToSuperview().inset(16)
        }
        
        kurlyBrandImageView.snp.makeConstraints {
            $0.top.equalTo(kurlyGoodSecondBodyLabel.snp.bottom).offset(26)
            $0.leading.equalToSuperview().inset(15)
        }
        
        kurlyBrandTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyGoodSecondBodyLabel.snp.bottom).offset(37)
            $0.leading.equalTo(kurlyBrandImageView.snp.trailing).offset(6)
        }
        
        kurlyBrandSubTitleLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyGoodSecondBodyLabel.snp.bottom).offset(41)
            $0.leading.equalTo(kurlyBrandTitleLabel.snp.trailing).offset(2)
        }
        
        kurlyBrandBodyLabel.snp.makeConstraints {
            $0.top.equalTo(kurlyBrandImageView.snp.bottom).offset(11)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
