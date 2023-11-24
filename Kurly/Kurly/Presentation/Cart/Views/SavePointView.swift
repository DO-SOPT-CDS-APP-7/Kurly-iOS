//
//  SavePointView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/24.
//

import UIKit

import SnapKit
import Then

class SavePointView: BaseView {
    
    private let saveLabel = UILabel()
    private let saveBackgroundView = UIView()
    private let savePointLabel = UILabel()
    private let addSavePointPercent = UILabel()
    private let helpInfoButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .gray1
        self.makeCornerRound(radius: 4)
        
        saveLabel.do {
            $0.text = "적립"
            $0.textColor = .white
            $0.font = .fontGuide(.body_medium_11)
        }
        
        saveBackgroundView.do {
            $0.backgroundColor = .yellow
            $0.makeCornerRound(radius: 10)
        }
        
        savePointLabel.do {
            $0.text = "최대 236원 적립"
            $0.textColor = .gray5
            $0.font = .fontGuide(.body_semibold_13)
        }
        
        addSavePointPercent.do {
            $0.text = "웰컴 5%"
            $0.textColor = .gray5
            $0.font = .fontGuide(.body_regular_12)
        }
        
        helpInfoButton.do {
            $0.setImage(ImageLiterals.Home.icn.helpButton, for: .normal)
        }
    }
    
    override func setLayout() {
        self.addSubviews(saveBackgroundView, savePointLabel, savePointLabel, addSavePointPercent, helpInfoButton)
        saveBackgroundView.addSubview(saveLabel)
        
        saveBackgroundView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(76)
            $0.width.equalTo(30)
            $0.height.equalTo(18)
        }
        
        saveLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
        
        savePointLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(saveBackgroundView.snp.trailing).offset(6)
        }
        
        addSavePointPercent.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(savePointLabel.snp.trailing).offset(5)
        }
        
        helpInfoButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(addSavePointPercent.snp.trailing).offset(3)
            $0.trailing.equalToSuperview().inset(70)
        }
    }
}
