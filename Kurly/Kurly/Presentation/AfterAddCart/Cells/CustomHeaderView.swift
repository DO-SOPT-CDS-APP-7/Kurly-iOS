//
//  CustomHeaderView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/27/23.
//

import UIKit

import SnapKit
import Then

class CustomHeaderView: UICollectionReusableView {
    
    let identifier: String = className
    
    private let headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomHeaderView {
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .white
        }
        
        headerLabel.do {
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
    }
    
    private func setLayout() {
        addSubview(headerLabel)
        
        headerLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
        }
    }
}

extension CustomHeaderView {
    
    func bindData(text: String) {
        headerLabel.text = text
    }
}
