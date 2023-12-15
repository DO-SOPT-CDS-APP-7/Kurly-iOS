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
    
    var cartType: CartViewType = .emptyCart {
        didSet {
            bottomCTAButton.titleType = self.cartType == .emptyCart ? .emptyCart : .order

            setLayout()
        }
    }
    
    var cartHeaderView: CartHeaderView
    var bottomCTAButton: BottomCTAButton
    let navigationBar = CustomNavigationBar(type: .closeButton)
    let cartItemCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let divider = UIView()
    private let emptyItemView = EmptyItemView()
    
    private var cartAddressViewHeight: CGFloat?
    private var navigationBarViewHeight: CGFloat?
    
    private var dividerHeightConstraint: Constraint?
    
    init(type: CartViewType) {
        self.cartType = type
        self.cartHeaderView = CartHeaderView(type: type)
        self.bottomCTAButton = BottomCTAButton(type: type == .emptyCart ? .emptyCart : .order)
        super.init(frame: .zero)
        layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cartAddressViewHeight = cartHeaderView.cartAddressView.frame.size.height
        navigationBarViewHeight = navigationBar.frame.size.height
    }
    
    override func setUI() {
        self.backgroundColor = .white
        
        divider.do {
            $0.backgroundColor = . gray2
        }
        
        cartItemCollectionView.do {
            $0.backgroundColor = .white
            $0.showsVerticalScrollIndicator = false
            $0.contentInset = UIEdgeInsets(top: 167 + 8, left: 0, bottom: 0, right: 0)
        }
    }
    
    override func setLayout() {
        dividerHeightConstraint = nil
        divider.removeFromSuperview()
        cartItemCollectionView.removeFromSuperview()
        emptyItemView.removeFromSuperview()
        
        if cartType == .order {
            self.addSubview(cartItemCollectionView)
        
            cartItemCollectionView.snp.makeConstraints {
                $0.top.equalTo(self.safeAreaLayoutGuide)
                $0.horizontalEdges.equalToSuperview()
                $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(80)
            }
        }
        
        self.addSubviews(navigationBar, cartHeaderView, divider, bottomCTAButton)
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        cartHeaderView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(cartHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            self.dividerHeightConstraint = $0.height.equalTo(8).constraint
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
        }
    }
}

extension CartView {
    
    func bindPrice(totalPrice: Int) {
        self.bottomCTAButton.setTitle("\(totalPrice.priceText) 주문하기", for: .normal)
    }
}

extension CartView {
    
    func updateView(forScrollOffset yOffset: CGFloat) {
    
        let scrollyOffset = -yOffset - 175

        let cartAddressViewAlpha = max((30 + scrollyOffset) / (30 - 0), 0)
        let dividerAlpha = max((10 + scrollyOffset) / (10 - 0), 0)
        
        cartHeaderView.cartAddressView.alpha = cartAddressViewAlpha
        cartHeaderView.divider.alpha = dividerAlpha
        
        let allSecletedItemViewTopConstraint = max(73 + scrollyOffset, 0)
        let dividerHeigthConstraint = max(8 + scrollyOffset, 0)
        
        if dividerHeigthConstraint >= 0 && dividerHeigthConstraint <= 8 {
            dividerHeightConstraint?.update(offset: dividerHeigthConstraint)
        }
        
        if cartHeaderView.cartAddressView.alpha == 0 {
            cartHeaderView.cartAddressView.isHidden = true
            
            cartHeaderView.headerTopConstraint?.update(offset: allSecletedItemViewTopConstraint)
        } else {
            cartHeaderView.cartAddressView.isHidden = false
            
            cartHeaderView.headerTopConstraint?.update(offset: allSecletedItemViewTopConstraint)
        }
        
        self.layoutIfNeeded()
    }
}
