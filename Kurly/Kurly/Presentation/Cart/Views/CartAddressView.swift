//
//  CartAddressView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/28.
//

import UIKit

import SnapKit
import Then

final class CartAddressView: BaseView {

    private let locationImage = UIImageView()
    private let addressLabel = UILabel()
    private let deliveryTypeLabel = UILabel()
    let changeAddressButton = UIButton()
    private let addressStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setUI() {
        self.backgroundColor = .white
        
        addressLabel.do {
            $0.text = "서울시 광진구 능동로 120\n건국대학교"
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
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
        
        addressStackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .fill
            $0.spacing = 4.0
            $0.addArrangedSubviews(addressLabel, deliveryTypeLabel)
        }
    }
    
    override func setLayout() {
        self.addSubviews(locationImage, addressStackView, changeAddressButton)
        
        addressLabel.snp.makeConstraints {
            $0.height.equalTo(36)
        }
        
        locationImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalTo(addressStackView.snp.leading).inset(-10)
            $0.bottom.equalToSuperview().inset(42)
        }
        
        addressStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.trailing.equalTo(changeAddressButton.snp.leading).inset(-101)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        changeAddressButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(3)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(38)
            $0.width.equalTo(49)
            $0.height.equalTo(31)
        }
    }
}
