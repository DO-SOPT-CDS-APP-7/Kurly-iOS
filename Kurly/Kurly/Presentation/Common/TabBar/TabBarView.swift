//
//  TabView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

enum TabBarItem: String, CaseIterable {
    case home = "상품설명"
    case kids = "상세정보"
    case tvSeries = "후기 9,999+"
    case movies = "문의"
}

final class TabBarView: UIView {
    private lazy var tapList = TabBarItem.allCases
    
    private var isHomeSelected = true
    private var selectedTapIndex: Int = 0
    private var selectedTapRect: TapRect!
    
    private lazy var tapViewCollectionView = TapCollectionView(frame: .zero, collectionViewLayout: setFlowLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        basicSetup()
        setStyle()
        setLayout()
    }
    
    private func basicSetup() {
        self.backgroundColor = .clear
        tapViewCollectionView.delegate = self
        tapViewCollectionView.dataSource = self
    }
    
    private func setStyle() {
        tapViewCollectionView.do {
            $0.register(HomeHeaderTapCollectionViewCell.self, forCellWithReuseIdentifier: HomeHeaderTapCollectionViewCell.className)
        }
    }
    
    private func setLayout() {
        self.addSubviews(tapViewCollectionView)
        
        tapViewCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarView {
    private func setFlowLayout() -> UICollectionViewFlowLayout {
        let tapViewFlowLayout = UICollectionViewFlowLayout()
        tapViewFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        tapViewFlowLayout.scrollDirection = .horizontal
        tapViewFlowLayout.minimumLineSpacing = 5
        return tapViewFlowLayout
    }
}

extension TabBarView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        isHomeSelected = false
        selectedTapIndex = indexPath.item
        
        let selectedTapRect: TapRect = collectionView.fetchCellRectFor(indexPath: indexPath, paddingFromLeading: 15, cellHorizontalPadding: 20)
        
        tapViewCollectionView.moveUnderlineFor(at: selectedTapRect)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tapList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderTapCollectionViewCell.className, for: indexPath) as? HomeHeaderTapCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.item == 0 && isHomeSelected == true {
            cell.isSelected = true
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
        }
        
        if indexPath.item == 1 {
            cell.configureCellWithImage(tapMenu: tapList[indexPath.item].rawValue)
            return cell
        } else {
            cell.configureCell(tapMenu: tapList[indexPath.item].rawValue)
            return cell
        }
    }
}
