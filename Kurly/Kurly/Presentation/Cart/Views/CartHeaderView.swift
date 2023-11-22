//
//  CartHeaderView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/21.
//

import UIKit

import SnapKit
import Then

final class CartHeaderView: BaseView {

    private let addressLabel = UILabel()
    private let deliveryTypeLabel = UILabel()
    private let locationImage = UIImageView()
    private let changeAddressButton = UIButton()
    private let selectAllItemButton = UIButton()
    private let selectItemCountLabel = UILabel()
    private let selectDeleteItemButton = UIButton()
    private let addressStackView = UIStackView()
    private let bottomStackView = UIStackView()
    private let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white
        
        addressLabel.do {
            $0.text = "서울시 광진구 능동로 120\n건국대학교"
            $0.numberOfLines = 2
            $0.font = .fontGuide(.body_regular_15)
            $0.textColor = .gray6
        }
        
        deliveryTypeLabel.do {
            $0.text = "샛별배송"
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .kuPurple
        }
        
        locationImage.do {
            $0.image = ImageLiterals.Home.icn.locationButtonGray
        }
        
        changeAddressButton.do {
            $0.setTitle("변경", for: .normal)
            $0.titleLabel?.font = .fontGuide(.title_regular_14)
            $0.setTitleColor(.gray6, for: .normal)
            $0.makeRoundBorder(cornerRadius: 4, borderWidth: 1, borderColor: .gray3)
        }
        
        selectAllItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.checkButtonDefault, for: .normal)
            $0.setImage(ImageLiterals.Home.icn.checkButtonPressed, for: .selected)
        }
        
        selectItemCountLabel.do {
            $0.text = "전체선택 (1/1)"
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray5
        }
        
        selectDeleteItemButton.do {
            $0.setTitle("선택삭제", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_medium_14)
            $0.setTitleColor(.gray5, for: .normal)
        }
        
        addressStackView.do {
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.alignment = .leading
            $0.spacing = 4.0
            $0.addArrangedSubviews(addressLabel, deliveryTypeLabel)
        }
        
        bottomStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 6
            $0.addArrangedSubviews(selectAllItemButton, selectItemCountLabel, selectDeleteItemButton)
            $0.layoutMargins = UIEdgeInsets(top: 6, left: 14, bottom: 6, right: 20)
            $0.isLayoutMarginsRelativeArrangement = true
            selectItemCountLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            selectAllItemButton.setContentHuggingPriority(.required, for: .horizontal)
            selectDeleteItemButton.setContentHuggingPriority(.required, for: .horizontal)
        }
        
        divider.do {
            $0.frame = CGRect(x: 0, y: 0, width: SizeLiterals.Screen.screenWidth, height: 0.5)
            $0.backgroundColor = .gray2
        }
    }
    
    override func setLayout() {
        self.addSubviews(locationImage, addressStackView, changeAddressButton, divider, bottomStackView)
        
        locationImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(addressStackView.snp.leading).inset(-10)
        }
        
        addressStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.trailing.equalTo(changeAddressButton.snp.leading).inset(-101)
        }
        
        changeAddressButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(49)
            $0.height.equalTo(31)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(addressStackView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        
        bottomStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(divider.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
}
