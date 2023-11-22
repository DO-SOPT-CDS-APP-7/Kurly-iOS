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
    let recommendCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    let relatedProductButton = BottomCTAButton(type: .more)
    let notifyAddToastView = NotifyAddToastView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setCollectionViewLayout()
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
        
        recommendCollectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setLayout() {
        addSubviews(grabberView, recommendCollectionView, relatedProductButton, notifyAddToastView)
        
        grabberView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(34)
            $0.height.equalTo(4)
        }
        
        recommendCollectionView.snp.makeConstraints {
            $0.top.equalTo(grabberView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(657)
        }
        
        relatedProductButton.snp.makeConstraints {
            $0.top.equalTo(recommendCollectionView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
        }
        
        notifyAddToastView.snp.makeConstraints {
            $0.bottom.equalTo(self.snp.bottom)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
    }
    
    func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (SizeLiterals.Screen.screenWidth - 48) / 3 , height: 273)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        recommendCollectionView.collectionViewLayout = flowLayout
    }
}
