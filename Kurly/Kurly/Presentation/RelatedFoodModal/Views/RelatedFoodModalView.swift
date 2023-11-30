//
//  RelatedFoodModalView.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class RelatedFoodModalView: BaseView {
    
    private let grabberView = UIView()
    var collectionView = CustomCollectionView(type: .withHeaderFooter, model: RelatedModel.dummys(), model2: RelatedModel.dummys())
    let relatedProductButton = BottomCTAButton(type: .more)
    let notifyAddToastView = NotifyAddToastView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.do {
            $0.backgroundColor = .white
        }
        
        grabberView.do {
            $0.backgroundColor = .gray3
            $0.makeCornerRound(radius: 2)
        }
        
        collectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setLayout() {
        addSubviews(grabberView, collectionView, relatedProductButton, notifyAddToastView)
        
        grabberView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(34)
            $0.height.equalTo(4)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(grabberView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(657)
        }
        
        relatedProductButton.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        notifyAddToastView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
    }
}
