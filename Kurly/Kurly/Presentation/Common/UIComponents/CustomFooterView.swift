//
//  CustomFooterView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/27/23.
//

import UIKit

import SnapKit
import Then

class CustomFooterView: UICollectionReusableView {
    
    let identifier: String = className

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomFooterView {
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .gray1
        }
    }
}
