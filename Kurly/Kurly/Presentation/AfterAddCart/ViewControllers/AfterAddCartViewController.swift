//
//  AfterAddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

final class AfterAddCartViewController: BaseViewController {
    
    private var price: Int = 10000
    
    private let afterAddCartView = AfterAddCartView()
    
    private let dummy = RelatedModel.dummy()
    
    override func loadView() {
        self.view = afterAddCartView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindModel()
        setTarget()
    }
}

extension AfterAddCartViewController {
    
    private func bindModel() {
        afterAddCartView.bindPrice(buyPrice: price)
    }
    
    private func setTarget() {
        afterAddCartView.buyButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
}

extension AfterAddCartViewController {
    
    @objc func tapButton() {
        print("tapButton")
    }
}
//
//extension AfterAddCartViewController: UICollectionViewDataSource {
//    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return dummy.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatedCollectionViewCell.identifier, for: indexPath) as? RelatedCollectionViewCell else { return UICollectionViewCell()}
//        cell.bindData(model: dummy[indexPath.row])
//        return cell
//    }
//}
//
//extension AfterAddCartViewController: UICollectionViewDelegateFlowLayout {
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: (SizeLiterals.Screen.screenWidth - 52) / 3 , height: 257)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout flowLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 8.0
//    }
//}
