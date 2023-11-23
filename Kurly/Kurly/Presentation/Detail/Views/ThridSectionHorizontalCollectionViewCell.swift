//
//  ThridSectionHorizontalCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/23/23.
//

import UIKit

class ThridSectionHorizontalCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ThridSectionHorizontalCollectionViewCell"
    
    private lazy var horizontalCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    private let relatedFoodModalView = RelatedFoodModalView()
    private var relatedFoodList: [RecommendModel] = [
        .init(foodImage: ImageLiterals.Home.img.activityTop01, foodName: "[시골보쌈과 감자옹심이 감자...", foodPrice: "10,500원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop02, foodName: "[이연복의 목란] 짬뽕 2인분...", foodPrice: "13,800원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop03, foodName: "[방방곡곡] 비빔국수 키트(2인...", foodPrice: "9,900원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop01, foodName: "[시골보쌈과 감자옹심이 감자...", foodPrice: "10,500원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop02, foodName: "[이연복의 목란] 짬뽕 2인분...", foodPrice: "13,800원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop03, foodName: "[방방곡곡] 비빔국수 키트(2인...", foodPrice: "9,900원")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setDelegates()
        setRegister()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDelegates() {
        self.horizontalCollectionView.delegate = self
        self.horizontalCollectionView.dataSource = self
    }
    
    private func setRegister() {
        self.horizontalCollectionView.register(RecommendCollectionViewCell.self,
                                               forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        relatedFoodModalView.recommendCollectionView.register(RecommendCollectionViewCell.self,
                                                              forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        
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
        self.addSubview(horizontalCollectionView)
        
        horizontalCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ThridSectionHorizontalCollectionViewCell: UICollectionViewDelegate {}
extension ThridSectionHorizontalCollectionViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell()}
        item.bindData(cellData: relatedFoodList[indexPath.row])
        return item
    }
}

extension ThridSectionHorizontalCollectionViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 276)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout flowLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
}
