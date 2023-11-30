//
//  ThridSectionHorizontalCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/23/23.
//

import UIKit

class ThridSectionHorizontalCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "ThridSectionHorizontalCollectionViewCell"
    
    private lazy var horizontalCollectionView = CustomCollectionView(type: .withHeader, model: RelatedModel.dummy(), model2: nil)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        horizontalCollectionView.do {
            $0.backgroundColor = .clear
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .horizontal
            $0.collectionViewLayout = flowLayout
        }
    }
    
    private func setLayout() {
        self.contentView.addSubview(horizontalCollectionView)
        
        horizontalCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

