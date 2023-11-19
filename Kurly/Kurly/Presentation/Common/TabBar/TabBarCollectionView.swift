//
//  TabBarCollectionView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

final class TabBarCollectionView: UICollectionView {

    private let underlineView = UIView()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        basicSetup()
        setStyle()
        setLayout()
    }
    
    private func basicSetup() {
        self.backgroundColor = .clear
        self.isScrollEnabled = true
        self.showsHorizontalScrollIndicator = false
    }

    private func setStyle() {
        underlineView.do {
            $0.backgroundColor = .kuPurple
        }
    }

    private func setLayout() {
        self.addSubview(underlineView)
        
        underlineView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.centerY.equalToSuperview().offset(20)
            $0.width.equalTo(56)
            $0.leading.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarCollectionView {
    func moveUnderlineFor(at tabBarRect: TabBarRect) {
        underlineView.snp.updateConstraints {
            $0.height.equalTo(2)
            $0.centerY.equalToSuperview().offset(20)
            $0.width.equalTo(tabBarRect.width)
            $0.leading.equalTo(tabBarRect.xPosition.x)
        }
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}
