//
//  DetailView.swift
//  Kurly
//
//  Created by 김보연 on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class DetailView: BaseView {
    
    let detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(DetailView()) has been successfully Removed")
    }
    
    override func setUI() {
        detailCollectionView.do {
            $0.backgroundColor = .white
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            $0.collectionViewLayout = flowLayout
        }
    }
    
    override func setLayout() {
        self.addSubviews(detailCollectionView)
        
        detailCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(95)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
