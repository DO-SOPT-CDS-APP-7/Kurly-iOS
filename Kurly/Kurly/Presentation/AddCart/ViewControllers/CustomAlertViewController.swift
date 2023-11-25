//
//  CustomAlertViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class CustomAlertViewController: BaseViewController {
    
    var alertTitle: String?
    var message: String?
    var addActionConfirm: AddAction?
    
    private lazy var alertView = UIView()
    private lazy var titleLabel = UILabel()
    private lazy var messageLabel = UILabel()
    private lazy var horizontalDividerView = UIView()
    private lazy var confirmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUI() {
        self.view.backgroundColor = .black.withAlphaComponent(0.3)
        
        alertView.do {
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .white
            $0.makeBorder(width: 1, color: .gray3)
        }
        
        titleLabel.do {
            $0.font = .fontGuide(.title_semibold_18)
            $0.textColor = .gray7
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = alertTitle
        }
        
        messageLabel.do {
            $0.font = .fontGuide(.body2_medium_14)
            $00.textColor = .gray5
            $0.textAlignment = .center
            $0.numberOfLines = 0
            $0.text = message
        }
        
        horizontalDividerView.do {
            $0.backgroundColor = .gray3
        }
        
        confirmButton.do {
            $0.setTitleColor(.label, for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_bold_15)
            $0.setTitleColor(.kuPurple, for: .normal)
            $0.setTitle(addActionConfirm?.text, for: .normal)
            $0.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        }
    }
    
    override func setLayout() {
        view.addSubview(alertView)
        alertView.addSubviews(titleLabel, messageLabel, horizontalDividerView, confirmButton)
        alertView.snp.makeConstraints {
            $0.width.equalTo(290)
            $0.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.width.equalTo(260)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(34)
        }
        
        messageLabel.snp.makeConstraints {
            $0.width.equalTo(260)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(18)
        }
        
        horizontalDividerView.snp.makeConstraints {
            $0.width.centerX.equalToSuperview()
            $0.height.equalTo(0.5)
            $0.top.equalTo(messageLabel.snp.bottom).offset(34)
        }
        
        confirmButton.snp.makeConstraints {
            $0.width.equalTo(290)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(50)
            $0.top.equalTo(horizontalDividerView.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
}

extension CustomAlertViewController {
    
    @objc func pressed() {
        addActionConfirm?.action?()
        dismiss(animated: true)
    }
}
