//
//  RecommendHeaderView.swift
//  Kurly
//
//  Created by 강민수 on 11/21/23.
//

import UIKit

import SnapKit
import Then

class RecommendHeaderView: UICollectionReusableView, CollectionSectionViewRegisterDequeueProtocol {
    
    static let identifier: String = "RecommendHeaderView"
    
    private let sectionLabel = UILabel()
    
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
            $0.backgroundColor = .white
        }
        
        sectionLabel.do {
            $0.text = "다른 고객이 함께 본 상품"
            $0.font = .fontGuide(.title_semibold_16)
            $0.textColor = .gray6
        }
    }
    
    private func setLayout() {
        addSubview(sectionLabel)
        
        sectionLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    func bindData(sectionText: String) {
        sectionLabel.text = sectionText
    }
}
