//
//  RecommendCollectionViewCell.swift
//  Kurly
//
//  Created by 강민수 on 11/21/23.
//

import UIKit

import SnapKit
import Then

class RecommendCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "RecommendCollectionViewCell"
    
    private let cellStackView = UIStackView()
    private let foodImageView = UIImageView()
    private let putButton = UIButton()
    private let infoStackView = UIStackView()
    private let shippingLabel = UILabel()
    private let foodNameLabel = UILabel()
    private let foodPriceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        cellStackView.do {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .center
        }
        
        foodImageView.do {
            $0.makeCornerRound(radius: 4)
        }
        
        putButton.do {
            $0.backgroundColor = .white
            $0.layer.cornerRadius = 4
            $0.makeBorder(width: 1, color: .gray3)
            $0.setTitleColor(.gray6, for: .normal)
            $0.setTitle("담기", for: .normal)
            $0.titleLabel?.font = .fontGuide(.body_regular_13)
            $0.setImage(ImageLiterals.Home.icn.cartButton22, for: .normal)
            $0.contentHorizontalAlignment = .center
        }
        
        infoStackView.do {
            $0.axis = .vertical
            $0.spacing = 3
            $0.alignment = .leading
        }
        
        shippingLabel.do {
            $0.text = "샛별배송"
            $0.font = .fontGuide(.body_regular_12)
            $0.textColor = .gray4
        }
        
        foodNameLabel.do {
            $0.font = .fontGuide(.body_regular_14)
            $0.textColor = .gray6
            $0.numberOfLines = 2
        }
        
        foodPriceLabel.do {
            $0.font = .fontGuide(.body_bold_15)
            $0.textColor = .gray6
        }
    }
    
    func setLayout() {
        addSubview(cellStackView)
        
        cellStackView.addArrangedSubviews(foodImageView, putButton, infoStackView)
        
        infoStackView.addArrangedSubviews(shippingLabel, foodNameLabel, foodPriceLabel)
        
        cellStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(16)
        }
        
        foodImageView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(139)
        }
        
        putButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(30)
        }
    }
    
    func bindData(cellData: RecommendModel) {
        foodImageView.image = cellData.foodImage
        foodNameLabel.text = cellData.foodName
        foodPriceLabel.text = cellData.foodPrice
    }
}
