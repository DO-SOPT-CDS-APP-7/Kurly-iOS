//
//  AllSelectedItemView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class AllSelectedItemView: BaseView {

    let selectAllItemButton = UIButton()
    private let selectItemCountLabel = UILabel()
    let selectDeleteItemButton = UIButton()
    let mainStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setUI() {
        self.backgroundColor = .white
        
        selectAllItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.checkButtonDefault, for: .normal)
            $0.setImage(ImageLiterals.Home.icn.checkButtonPressed, for: .selected)
        }
        
        selectItemCountLabel.do {
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray5
        }
        
        selectDeleteItemButton.do {
            $0.setTitle("선택삭제", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_medium_14)
            $0.setTitleColor(.gray5, for: .normal)
        }
        
        mainStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 6
            $0.addArrangedSubviews(selectAllItemButton, selectItemCountLabel, selectDeleteItemButton)
            selectItemCountLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            selectAllItemButton.setContentHuggingPriority(.required, for: .horizontal)
            selectDeleteItemButton.setContentHuggingPriority(.required, for: .horizontal)
        }
    }
    
    override func setLayout() {
        self.addSubviews(mainStackView)
        
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(6)
        }
    }
}

extension AllSelectedItemView {
    
    func bindData(seletedItemCount: Int, AllItemCount: Int) {
        selectItemCountLabel.text = "전체선택 (\(seletedItemCount)/\(AllItemCount))"
        
        if seletedItemCount == AllItemCount {
            selectAllItemButton.isSelected = true
        } else {
            selectAllItemButton.isSelected = false
        }
    }
}
