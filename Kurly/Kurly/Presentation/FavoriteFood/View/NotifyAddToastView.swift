//
//  NotifyAddToastView.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class NotifyAddToastView: BaseView {
    
    private let backgroundView = UIView()
    private let notifyMessageLabel = UILabel()
    private let shortcutButton = UIButton()
    private let shortcutImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        backgroundView.do {
            $0.backgroundColor = .gray6
            $0.makeCornerRound(radius: 6)
        }
        
        notifyMessageLabel.do {
            $0.text = "찜한 상품에 추가했어요"
            $0.font = .fontGuide(.body_regular_15)
            $0.textColor = .white
            $0.textAlignment = .left
            $0.backgroundColor = .clear
        }
        
        shortcutButton.do {
            $0.setTitle("바로가기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .clear
            $0.titleLabel?.font = .fontGuide(.body_regular_14)
        }
        
        shortcutImageView.do {
            $0.image = ImageLiterals.Home.icn.shortcutButtonBlack.withRenderingMode(.alwaysTemplate)
            $0.tintColor = .white
        }
    }
    
    override func setLayout() {
        addSubviews(backgroundView)
        
        backgroundView.addSubviews(notifyMessageLabel, shortcutButton, shortcutImageView)
        
        self.snp.makeConstraints {
            $0.height.equalTo(51)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(51)
        }
        
        notifyMessageLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(19)
            $0.centerY.equalToSuperview()
        }
        
        shortcutButton.snp.makeConstraints {
            $0.trailing.equalTo(shortcutImageView.snp.leading)
            $0.centerY.equalToSuperview()
        }
        
        shortcutImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(14)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(22)
        }
    }
}

extension NotifyAddToastView {
    func upToastView() {
        self.backgroundView.snp.remakeConstraints {
            $0.bottom.equalToSuperview().inset(42)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        self.layoutIfNeeded()
    }
    
    func downToastView() {
        self.backgroundView.snp.remakeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        self.layoutIfNeeded()
    }
}
