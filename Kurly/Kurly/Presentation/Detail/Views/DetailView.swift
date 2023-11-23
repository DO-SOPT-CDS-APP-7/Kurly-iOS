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
        setDelegates()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(DetailView()) has been successfully Removed")
    }
    
    private func setDelegates() {
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    private func setRegister() {
        self.detailCollectionView.register(FirstSectionCollectionViewCell.self, forCellWithReuseIdentifier: FirstSectionCollectionViewCell.identifier)
        self.detailCollectionView.register(SecondSectionCollectionViewCell.self, forCellWithReuseIdentifier: SecondSectionCollectionViewCell.identifier)
        self.detailCollectionView.register(ThridSectionHorizontalCollectionViewCell.self,
                                                              forCellWithReuseIdentifier: ThridSectionHorizontalCollectionViewCell.identifier)
        self.detailCollectionView.register(FourthSectionCollectionViewCell.self,
                                                              forCellWithReuseIdentifier: FourthSectionCollectionViewCell.identifier)
        self.detailCollectionView.register(RecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendHeaderView.identifier)
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

extension DetailView: UICollectionViewDelegate {}
extension DetailView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections[section].count
        
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else {return UICollectionViewCell()}
            item.bindModel(model: sections[indexPath.section][indexPath.item])
            return item
            
        case 1:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: SecondSectionCollectionViewCell.identifier, for: indexPath) as? SecondSectionCollectionViewCell else {return UICollectionViewCell()}
            return item
            
        case 2:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: ThridSectionHorizontalCollectionViewCell.identifier, for: indexPath) as? ThridSectionHorizontalCollectionViewCell else {return UICollectionViewCell()}
            return item
            
        case 3:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: FourthSectionCollectionViewCell.identifier, for: indexPath) as? FourthSectionCollectionViewCell else {return UICollectionViewCell()}
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
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 779 / 812)
            
        case 1:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 132 / 812)
            
        case 2:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 276 / 812)
            
        case 3:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 370 / 812)

        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 61)
            
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 2:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendHeaderView.identifier, for: indexPath) as? RecommendHeaderView else { return UICollectionReusableView()}
                headerView.bindData(sectionText: "다른 고객이 함께 본 상품")
                return headerView
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
