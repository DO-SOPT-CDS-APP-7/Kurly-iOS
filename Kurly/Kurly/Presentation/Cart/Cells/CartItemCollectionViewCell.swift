//
//  CartItemCollectionViewCell.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/22.
//

import UIKit

import SnapKit
import Then

final class CartItemCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "CartItemCollectionViewCell"
    
    weak var itemDelegate: SelectedItemProtocol?
    weak var stepperDelegate: UpdatingStepperProtocol?

    var itemRow: Int?
    lazy var selectItemButton = UIButton()
    private let itemLabel = UILabel()
    let deleteItemButton = UIButton()
    private let itemImageView = UIImageView()
    private let itemDiscountPrice = UILabel()
    private let itemPrice = UILabel()
    let stepper = Stepper()
    private let topStackView = UIStackView()
    private let priceStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        selectItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.checkButtonDefault, for: .normal)
            $0.setImage(ImageLiterals.Home.icn.checkButtonPressed, for: .selected)
            $0.addTarget(self, action: #selector(tapSelectItemButton), for: .touchUpInside)
        }
        
        itemLabel.do {
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray6
            $0.numberOfLines = 2
            $0.lineBreakMode = .byWordWrapping
        }
        
        deleteItemButton.do {
            $0.setImage(ImageLiterals.Home.icn.closeButtonGray, for: .normal)
        }
        
        itemImageView.do {
            $0.image = ImageLiterals.Home.img.large
            $0.sizeToFit()
        }
        
        itemDiscountPrice.do {
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
        
        itemPrice.do {
            $0.font = .fontGuide(.body_medium_15)
            $0.textColor = .gray4
        }
        
        stepper.do {
            $0.minusButton.addTarget(self, action: #selector(tapUpdateValueStepper), for: .touchUpInside)
            
            $0.plusButton.addTarget(self, action: #selector(tapUpdateValueStepper), for: .touchUpInside)
        }
        
        topStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 6
            $0.addArrangedSubviews(selectItemButton, itemLabel, deleteItemButton)
            itemLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            selectItemButton.setContentHuggingPriority(.required, for: .horizontal)
            deleteItemButton.setContentHuggingPriority(.required, for: .horizontal)
        }
        
        priceStackView.do {
            $0.axis = .horizontal
            $0.distribution = .fillProportionally
            $0.spacing = 2
            $0.addArrangedSubviews(itemDiscountPrice, itemPrice)
        }
    }
    
    private func setLayout() {
        self.addSubviews(topStackView, itemImageView, priceStackView, stepper)
        
        selectItemButton.snp.makeConstraints {
            $0.width.equalTo(36)
        }
        
        deleteItemButton.snp.makeConstraints {
            $0.width.equalTo(36)
        }
        
        topStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.leading.equalToSuperview().offset(14)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        itemImageView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(7)
            $0.leading.equalToSuperview().offset(56)
            $0.width.equalTo(60)
            $0.height.equalTo(78)
        }
        
        priceStackView.snp.makeConstraints {
            $0.top.equalTo(topStackView.snp.bottom).offset(8)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(20)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(priceStackView.snp.bottom).offset(22)
            $0.leading.equalTo(itemImageView.snp.trailing).offset(20)
        }
    }
}

extension CartItemCollectionViewCell {
    
    func bindModel(model: CartModel) {
        self.itemRow = model.id
        self.itemLabel.text = model.productName
        self.itemDiscountPrice.text = "\(Int(model.discountedPrice).priceText)"
        self.itemPrice.text = "\(Int(model.calculatePrice).priceText)"
        self.itemPrice.attributedText = itemPrice.text?.strikeThrough()
        
        self.selectItemButton.isSelected = model.isSelect
        self.stepper.value = model.itemCount
    }
}

extension CartItemCollectionViewCell {
    
    @objc func tapSelectItemButton(_ sender: UIButton) {
        print("개별 상품 선택하기!")
        sender.isSelected.toggle()
        
        self.itemDelegate?.getButtonState(state: self.selectItemButton.isSelected, row: itemRow ?? 0)
    }
    
    @objc func tapUpdateValueStepper(_ sender: UIButton) {
        if(stepper.value == 1 && sender.tag == -1) {
            print("최소구매수량 1")
        } else {
            stepper.value += sender.tag
            print(stepper.value)

            self.stepperDelegate?.updateStepperValue(value: stepper.value, row: itemRow ?? 0)
        }
    }
}

protocol SelectedItemProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

protocol UpdatingStepperProtocol: NSObject {
    func updateStepperValue(value: Int, row: Int)
}
