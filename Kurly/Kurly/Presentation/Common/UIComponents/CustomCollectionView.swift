//
//  CustomCollectionView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/25/23.
//

import UIKit

class CustomCollectionView: UICollectionView {
    
    init() {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setUI()
        setLayout()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCollectionView {
    
    private func setUI() {
        self.do {
            $0.backgroundColor = .white
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            $0.collectionViewLayout = flowLayout
        }
    }
    
    private func setLayout() { }
    
    private func setRegister() {
        self.register(RelatedCollectionViewCell.self, forCellWithReuseIdentifier: RelatedCollectionViewCell.className)
    }
}
