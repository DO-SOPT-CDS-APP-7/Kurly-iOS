//
//  CustomCollectionView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/25/23.
//

import UIKit

enum CollectionViewType {
    case withHeader
    case withHeaderFooter
    
    var numberOfSection: Int {
        switch self {
        case .withHeader:
            return 1
        case .withHeaderFooter:
            return 2
        }
    }
}

class CustomCollectionView: UICollectionView {
    
    private var collectionViewType: CollectionViewType
    
    private var product: [RelatedModel]
    private var product2: [RelatedModel]?
    
    init(type: CollectionViewType, model: [RelatedModel], model2: [RelatedModel]?) {
        self.collectionViewType = type
        self.product = model
        self.product2 = model2
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        setUI()
        setLayout()
        setRegister()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomCollectionView {
    
    func updateModel(with newModel: [RelatedModel], newModel2: [RelatedModel]?) {
        self.product = newModel
        self.product2 = newModel2
        reloadData()
    }
}

extension CustomCollectionView {
    
    private func setUI() {
        self.do {
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.scrollDirection = .vertical
            $0.collectionViewLayout = flowLayout
        }
    }
    
    private func setLayout() { }
    
    private func setRegister() {
        self.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.className)
        self.register(CustomHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CustomHeaderView.className)
        self.register(CustomFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CustomFooterView.className)
    }
    
    func setDelegates() {
        self.delegate = self
        self.dataSource = self
    }
}


extension CustomCollectionView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionViewType.numberOfSection
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return product.count
        } else {
            return product2?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell() }
        if indexPath.section == 0 {
            cell.bindData(model: product[indexPath.row])
        } else {
            if let product2 = product2 {
                cell.bindData(model: product2[indexPath.row])
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomHeaderView.className, for: indexPath) as? CustomHeaderView else { 
                return UICollectionReusableView() }
            switch indexPath.section {
            case 0:
                headerView.bindData(text: "다른 고객이 함께 본 상품")
            case 1:
                headerView.bindData(text: "함께 구매하면 좋은 상품")
            default:
                headerView.bindData(text: "")
            }
            return headerView
        }
        else {
            guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CustomFooterView.className, for: indexPath) as? CustomFooterView else { return UICollectionReusableView() }
            return footerView
        }
    }
}

extension CustomCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (SizeLiterals.Screen.screenWidth - 52) / 3 , height: 257)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout flowLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SizeLiterals.Screen.screenWidth, height: 51)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if collectionViewType == .withHeaderFooter && section == 0 {
            return CGSize(width: SizeLiterals.Screen.screenWidth, height: 24)
        }
        return .zero
    }
}
