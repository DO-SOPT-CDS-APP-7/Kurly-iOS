//
//  Stepper.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit
import Then
//
//protocol SetValueProtocol {
//    func setValue(_ value: Int)
//}

final class Stepper: UIControl {
    
    let minusButton = UIButton()
    let plusButton = UIButton()
    let label = UILabel()
    
    var value: Int = 1 {
        didSet {
            self.label.text = String(value)
            self.sendActions(for: .valueChanged)
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUI()
        setLayout()
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
}
