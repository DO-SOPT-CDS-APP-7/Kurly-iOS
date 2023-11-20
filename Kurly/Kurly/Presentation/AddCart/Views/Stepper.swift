//
//  Stepper.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class Stepper: UIControl {
    
    var minusButton = UIButton()
    var plusButton = UIButton()
    var label = UILabel()
    
    var value: Int = 1 {
        didSet {
            self.label.text = String(value)
            self.sendActions(for: .valueChanged)
        }
    }
    
    init(){
        super.init(frame: CGRect.zero)
        setUI()
        setLayout()
        setTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Stepper {
    
    private func setUI() {
        self.do {
            $0.makeCornerRound(radius: 4)
            $0.makeBorder(width: 1, color: .gray3)
        }
        
        minusButton.do {
            $0.tag = -1
            $0.setImage(ImageLiterals.addCart.minusButton, for: .normal)
        }
        
        plusButton.do {
            $0.tag = 1
            $0.setImage(ImageLiterals.addCart.plusButton, for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        }
        
        label.do {
            $0.text = String(value)
            $0.font = .fontGuide(.body_medium_14)
            $0.textAlignment = .center
        }
        
    }
    
    private func setLayout() {
        self.addSubviews(minusButton, plusButton, label)
        
        self.snp.makeConstraints {
            $0.width.equalTo(101)
            $0.height.equalTo(36)
        }
        
        minusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(5)
        }
        
        plusButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
        }
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func setTarget() {
        self.minusButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
        self.plusButton.addTarget(self, action: #selector(valueChange(_:)), for: .touchUpInside)
    }
}

extension Stepper {
    
    @objc func valueChange(_ sender: UIButton) {
        if(self.value == 1 && sender.tag == -1) {
            print("최소구매수량 1")
        }
        else {
            self.value += sender.tag
        }
    }
}
