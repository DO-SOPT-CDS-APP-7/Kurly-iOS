//
//  CompletedOrderView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/24.
//

import UIKit

import SnapKit
import Then

class CompletedOrderView: BaseView {
    
    private let completedImageView = UIImageView()
    private let completedTitelLabel = UILabel()
    let orderDetailCTAButton = BottomCTAButton(type: .orderDetail)
    let shoppingCTAButton = BottomCTAButton(type: .shopping)
    private let benefitStackView = UIStackView()
    private let benefitsInfoView1 = BenefitsInfoView()
    private let benefitsInfoView2 = BenefitsInfoView()
    private let divider = UIView()
    private let paymentLabel = UILabel()
    private let paymentPrice = UILabel()
    private let pointLabel = UILabel()
    private let pointTitleLabel = UILabel()
    private let subPointTitleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindDataBenefitsInfo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white
        
        completedImageView.do {
            $0.image = ImageLiterals.Home.icn.checkButton
        }
        
        completedTitelLabel.do {
            $0.text = "마켓컬리님의 주문이 완료되었습니다.\n내일 아침에 만나요!"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray7
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .center
        }
        
        benefitStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = 8
        }
        
        divider.do {
            $0.backgroundColor = .gray2
        }
        
        paymentLabel.do {
            $0.text = "결제금액"
            $0.textColor = .gray6
            $0.font = .fontGuide(.body_medium_16)
        }
        
        paymentPrice.do {
            $0.text = "4,720원"
            $0.textColor = .black
            $0.font = .fontGuide(.title_semibold_18)
        }
        
        pointLabel.do {
            $0.text = "+530원"
            $0.textColor = .gray6
            $0.font = .fontGuide(.body_medium_16)
        }
        
        pointTitleLabel.do {
            $0.text = "적립금"
            $0.textColor = .kuPurple
            $0.font = .fontGuide(.body_medium_16)
        }
        
        subPointTitleLabel.do {
            $0.text = "적립금은 배송당일 적립 (웰컴 5%)"
            $0.textColor = .kuPurple
            $0.font = .fontGuide(.body_regular_12)
        }
    }
    
    override func setLayout() {
        self.addSubviews(completedImageView, completedTitelLabel, benefitStackView, divider, paymentLabel, paymentPrice, pointLabel, pointTitleLabel, subPointTitleLabel, orderDetailCTAButton, shoppingCTAButton)
        
        completedImageView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(48)
            $0.centerX.equalToSuperview()
        }
        
        completedTitelLabel.snp.makeConstraints {
            $0.top.equalTo(completedImageView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
        
        benefitStackView.snp.makeConstraints {
            $0.top.equalTo(completedTitelLabel.snp.bottom).offset(48)
            $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            $0.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(benefitStackView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        paymentLabel.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(21)
            $0.leading.equalToSuperview().offset(16)
        }
        
        paymentPrice.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(19)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        pointLabel.snp.makeConstraints {
            $0.top.equalTo(paymentLabel.snp.bottom).offset(13)
            $0.leading.equalToSuperview().offset(16)
        }
        
        pointTitleLabel.snp.makeConstraints {
            $0.top.equalTo(paymentPrice.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        subPointTitleLabel.snp.makeConstraints {
            $0.top.equalTo(pointTitleLabel.snp.bottom).offset(2)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        orderDetailCTAButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(shoppingCTAButton.snp.top).inset(-14)
        }
        
        shoppingCTAButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
    }
}

extension CompletedOrderView {
    private func bindDataBenefitsInfo() {
        benefitsInfoView1.bindData(title: "첫 구매 감사혜택 1", benefit: "10,590분 무료배송", subBenefit: "15,000원 이상 주문 시, 지금부터 바로 적용")
        
        benefitsInfoView2.bindData(title: "첫 구매 감사혜택 2", benefit: "결제금액 5% 적립", subBenefit: "첫 주문 다음 날 오전부터 한 달간 적용")
        
        benefitStackView.addArrangedSubviews(benefitsInfoView1, benefitsInfoView2)
    }
}
