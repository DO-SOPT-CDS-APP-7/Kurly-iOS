//
//  CartView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/20.
//

import UIKit

import SnapKit
import Then

class CartView: BaseView {
    
    let navigationBar = CustomNavigationBar(type: .closeButton)
    let bottomCTAButton = BottomCTAButton(type: .order)
    let cartHeaderView = CartHeaderView()
    let cartItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
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
        self.backgroundColor = .white
        
        cartItemCollectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
        }
    }
    
    override func setLayout() {
        self.addSubviews(navigationBar, cartHeaderView, cartItemCollectionView, bottomCTAButton)

        navigationBar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cartHeaderView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cartItemCollectionView.snp.makeConstraints {
            $0.top.equalTo(cartHeaderView.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(bottomCTAButton.snp.top)
            $0.height.equalTo(486)
        }
        
        bottomCTAButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: SizeLiterals.Screen.screenWidth, height: 157)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
        cartItemCollectionView.collectionViewLayout = flowLayout
    }
}
