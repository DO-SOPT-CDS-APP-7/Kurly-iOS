//
//  RecommendFooterView.swift
//  Kurly
//
//  Created by 강민수 on 11/21/23.
//

import UIKit

import SnapKit
import Then

class RecommendFooterView: UICollectionReusableView {
    
    static let identifier: String = "RecommendFooterView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .gray1
        }
    }
    
    private func setLayout() {}
}
