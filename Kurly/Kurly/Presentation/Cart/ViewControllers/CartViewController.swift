//
//  CartViewController.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/20.
//

import UIKit

import SnapKit

final class CartViewController: BaseViewController {

    private let cartView = CartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
        setUI()
        setDelegates()
        setRegister()
    }
    
    override func loadView() {
        self.view = cartView
    }
    
    override func setUI() {
        self.view.backgroundColor = .gray2
        
    }
    
    override func setDelegates() {
        cartView.cartItemCollectionView.dataSource = self
        cartView.cartItemCollectionView.delegate = self
    }
    
    override func setRegister() {
        cartView.cartItemCollectionView.register(CartItemCollectionViewCell.self, forCellWithReuseIdentifier: CartItemCollectionViewCell.identifier)
        
        cartView.cartItemCollectionView.register(CartItemHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CartItemHeaderCollectionReusableView.identifier)
    }
}

extension CartViewController {
    
    private func setTarget() {
        cartView.navigationBar.closeButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        cartView.bottomCTAButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
    }
}

extension CartViewController {
    
    @objc func tapBackButton() {
        self.dismiss(animated: true)
    }
    
    @objc func tapOrderButton() {
        print("주문하기!")
    }
}

extension CartViewController: UICollectionViewDelegate {}

extension CartViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartItemCollectionViewCell.identifier, for: indexPath) as? CartItemCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: SizeLiterals.Screen.screenWidth, height: 56)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CartItemHeaderCollectionReusableView.identifier, for: indexPath) as? CartItemHeaderCollectionReusableView else { return UICollectionReusableView()}
        
        return headerView
    }
}
