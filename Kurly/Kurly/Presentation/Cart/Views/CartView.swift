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
    private let divider = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        divider.do {
            $0.backgroundColor = . gray2
        }
    }
    
    override func setLayout() {
        self.addSubviews(navigationBar, cartHeaderView, cartItemCollectionView, bottomCTAButton, divider)

        navigationBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(48)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cartHeaderView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(cartHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(8)
        }
        
        cartItemCollectionView.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(bottomCTAButton.snp.top).inset(-9)
        }
        
        bottomCTAButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
    }
}
