//
//  NotifyRemoveToastView.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class NotifyRemoveToastView: BaseView {
    
    private let backgroundView = UIView()
    private let notifyMessageLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        backgroundView.do {
            $0.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
            $0.layer.cornerRadius = 6
        }
        
        notifyMessageLabel.do {
            $0.text = "찜한 상품에서 삭제했어요"
            $0.font = .fontGuide(.body_regular_15)
            $0.textColor = .white
            $0.textAlignment = .center
            $0.backgroundColor = .clear
        }
    }
    
    override func setLayout() {
        addSubview(backgroundView)
        
        backgroundView.addSubview(notifyMessageLabel)
        
        self.snp.makeConstraints {
            $0.width.equalTo(SizeLiterals.Screen.screenWidth)
            $0.height.equalTo(51)
        }
        
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(self.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(51)
        }
        
        notifyMessageLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

extension NotifyRemoveToastView {
    
    func viewToastView() {
        UIView.animate(withDuration: 0.5) {
            self.backgroundView.snp.remakeConstraints {
                $0.bottom.equalToSuperview().inset(42)
                $0.height.equalTo(51)
                $0.leading.trailing.equalToSuperview().inset(8)
            }
            self.layoutIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5) {
                self.backgroundView.snp.remakeConstraints {
                    $0.top.equalTo(self.snp.bottom)
                    $0.height.equalTo(51)
                    $0.leading.trailing.equalToSuperview().inset(8)
                }
                self.layoutIfNeeded()
            }
        }
    }
}
