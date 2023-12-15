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
    
    var cartType: CartViewType {
        didSet {
            setUI()
            setLayout()
        }
    }
    
    let divider = UIView()
    let cartAddressView = CartAddressView()
    let allSelectedItemView = AllSelectedItemView()
    var headerTopConstraint: Constraint?
    
    init(type: CartViewType) {
        self.cartType = type
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white
        
        if cartType == .order {
            divider.do {
                $0.backgroundColor = .gray2
            }
        }
    }
    
    override func setLayout() {
        
        divider.removeFromSuperview()
        allSelectedItemView.removeFromSuperview()
        
        self.addSubview(cartAddressView)
        
        cartAddressView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }

        if cartType == .order {
            self.addSubviews(divider, allSelectedItemView)
            
            divider.snp.makeConstraints {
                $0.top.equalTo(cartAddressView.snp.bottom)
                $0.horizontalEdges.equalToSuperview()
                $0.height.equalTo(0.5)
            }
            
            allSelectedItemView.snp.makeConstraints {
                self.headerTopConstraint = $0.top.equalToSuperview().offset(73).constraint
                $0.horizontalEdges.equalToSuperview()
                $0.bottom.equalToSuperview()
            }
        }
    }
    
    @objc private func handleCartTypeDidChange(_ notification: Notification) {
        if let newCartType = notification.object as? CartViewType {
            cartType = newCartType
        }
    }
}
