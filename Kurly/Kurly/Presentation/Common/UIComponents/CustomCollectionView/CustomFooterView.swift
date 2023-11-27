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
    
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomFooterView {
    
    private func setUI() {
        label.do {
            $0.backgroundColor = .gray1
        }
    }
    
    private func setLayout() {
        self.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(8)
        }
    }
}
