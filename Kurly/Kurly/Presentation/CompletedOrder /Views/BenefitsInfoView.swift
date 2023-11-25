//
//  BenefitsInfoView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/25.
//

import UIKit

import SnapKit
import Then

class BenefitsInfoView: BaseView {

    private let mainStackView = UIStackView()
    private var titleLabel = UILabel()
    private var benefitLabel = UILabel()
    private var subBenefitLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .gray1
        self.makeCornerRound(radius: 6)
        
        titleLabel.do {
            $0.textColor = .kuPurple
            $0.font = .fontGuide(.title_semibold_16)
        }
        
        benefitLabel.do {
            $0.textColor = .gray7
            $0.font = .fontGuide(.title_semibold_18)
        }
        
        subBenefitLabel.do {
            $0.textColor = .gray4
            $0.font = .fontGuide(.title_regular_14)
        }
        
        mainStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillEqually
            $0.alignment = .center
            $0.spacing = 4
            $0.addArrangedSubviews(titleLabel, benefitLabel, subBenefitLabel)
        }
    }
    
    override func setLayout() {
        self.addSubviews(mainStackView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(101)
        }
        
        mainStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func bindData(title: String, benefit: String, subBenefit: String) {
        self.titleLabel.text = title
        self.benefitLabel.text = benefit
        self.subBenefitLabel.text = subBenefit
    }
}
