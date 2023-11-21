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
    
    private lazy var detailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    private let dummy = DetailProduct.dummy()
    
    private var sections: [[DetailProduct]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bindModel()
        basicSetup()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(DetailView()) has been successfully Removed")
    }
    
    private func basicSetup() {
        self.detailCollectionView.register(FirstSectionCollectionViewCell.self, forCellWithReuseIdentifier: FirstSectionCollectionViewCell.identifier)
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
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
            $0.edges.equalToSuperview()
        }
    }
}

extension DetailView {
    private func bindModel() {
        sections = [[dummy]]
    }
}

extension DetailView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections[section].count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else {return UICollectionViewCell()}
            item.bindModel(model: sections[indexPath.section][indexPath.item])
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension DetailView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            let itemHeight: CGFloat = 779
            return CGSize(width: collectionView.frame.width, height: itemHeight)
            
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
}
