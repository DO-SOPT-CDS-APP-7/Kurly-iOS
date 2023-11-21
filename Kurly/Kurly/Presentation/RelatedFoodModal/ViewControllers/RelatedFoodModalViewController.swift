//
//  RelatedFoodModalViewController.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class RelatedFoodModalViewController: BaseViewController {
    
    private let relatedFoodModalView = RelatedFoodModalView()
    
    override func loadView() {
        self.view = relatedFoodModalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSheetPresentation()
        setDelegates()
        setRegister()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        relatedFoodModalView.notifyAddToastView.viewToastView()
    }
    
    override func setDelegates() {
        relatedFoodModalView.recommendCollectionView.delegate = self
        relatedFoodModalView.recommendCollectionView.dataSource = self
    }
    
    override func setRegister() {
        relatedFoodModalView.recommendCollectionView.register(RecommendCollectionViewCell.self,
                                                              forCellWithReuseIdentifier: RecommendCollectionViewCell.identifier)
        relatedFoodModalView.recommendCollectionView.register(RecommendHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecommendHeaderView.identifier)
        relatedFoodModalView.recommendCollectionView.register(RecommendFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: RecommendFooterView.identifier)
    }
    
    private func setSheetPresentation() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
    }
}


extension RelatedFoodModalViewController: UICollectionViewDelegate {}

extension RelatedFoodModalViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCollectionViewCell.identifier, for: indexPath) as? RecommendCollectionViewCell else { return UICollectionViewCell()}
        return item
    }
}

extension RelatedFoodModalViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 51)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 8)
        } else {
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendHeaderView.identifier, for: indexPath) as? RecommendHeaderView else { return UICollectionReusableView()}
            if indexPath.section == 0 {
                headerView.bindData(sectionText: "다른 고객이 함께 본 상품")
            } else {
                headerView.bindData(sectionText: "함께 구매하면 좋은 상품")
            }
            return headerView
        } else if kind == UICollectionView.elementKindSectionFooter {
            guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendFooterView.identifier, for: indexPath) as? RecommendFooterView else { return UICollectionReusableView() }
            if indexPath.section == 0 {
                return footerView
            }
        }
        return UICollectionReusableView()
    }
}
