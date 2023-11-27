//
//  CartItemFooterCollectionReusableView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/24.
//

import UIKit

class CartItemFooterCollectionReusableView: UICollectionReusableView, CollectionSectionViewRegisterDequeueProtocol {
        
    static let identifier: String = className
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CartItemFooterCollectionReusableView {
    private func setUI() {
        self.backgroundColor = .gray2
    }
}
