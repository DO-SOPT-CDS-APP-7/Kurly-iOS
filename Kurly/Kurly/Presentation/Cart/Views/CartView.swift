//
//  CartView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/20.
//

import UIKit

import SnapKit
import Then

final class CartView: BaseView {
    
    var cartType: CartViewType
    let cartHeaderView: CartHeaderView
    let bottomCTAButton: BottomCTAButton
    let navigationBar = CustomNavigationBar(type: .closeButton)
    let cartItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let divider = UIView()
    private let emptyItemView = EmptyItemView()
    
    init(type: CartViewType) {
        self.cartType = type
        self.cartHeaderView = CartHeaderView(type: type)
        self.bottomCTAButton = BottomCTAButton(type: type == .emptyCart ? .emptyCart : .order)
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white

        divider.do {
            $0.backgroundColor = . gray2
        }
        
        if cartType == .order {
            cartItemCollectionView.do {
                $0.backgroundColor = .white
                $0.showsVerticalScrollIndicator = false
            }
        }
    }
    
    override func setLayout() {
        self.addSubviews(navigationBar, cartHeaderView, divider, bottomCTAButton)
        
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

        bottomCTAButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(16)
        }
        
        if cartType == .emptyCart {
            self.addSubview(emptyItemView)
            
            emptyItemView.snp.makeConstraints {
                $0.top.equalTo(divider.snp.top).offset(233)
                $0.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(bottomCTAButton.snp.top).inset(-214)
            }
        } else if cartType == .order {
            self.addSubview(cartItemCollectionView)
            
            cartItemCollectionView.snp.makeConstraints {
                $0.top.equalTo(divider.snp.bottom)
                $0.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(bottomCTAButton.snp.top).inset(-9)
            }
        }
    }
}
