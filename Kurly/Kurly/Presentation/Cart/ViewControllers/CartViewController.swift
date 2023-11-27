//
//  CartViewController.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/20.
//

import UIKit

import SnapKit

enum CartViewType {
    case emptyCart
    case order
}

final class CartViewController: BaseViewController {
    
    private let cartView = CartView(type: .order)
    private var dummy = CartModel.dummy()
    private var selectedItem: [CartModel] = [] {
        didSet {
            cartView.cartHeaderView.bindData(seletedItemCount: selectedItem.count, AllItemCount: dummy.count)
            
            let result = calculateSelectedItemPrice(seletedItem: self.selectedItem)
            cartView.bindPrice(totalPrice: result.totalPrice)
            cartView.cartItemCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
        setUI()
        setDelegates()
        setRegister()
        bindModel()
    }
    
    override func loadView() {
        self.view = cartView
    }
    
    override func setUI() {
        self.view.backgroundColor = .white
    }
    
    override func setDelegates() {
        cartView.cartItemCollectionView.dataSource = self
        cartView.cartItemCollectionView.delegate = self
    }
    
    override func setRegister() {
        CartItemCollectionViewCell.register(to: cartView.cartItemCollectionView)
        OrderPriceCollectionViewCell.register(to: cartView.cartItemCollectionView)

        cartView.cartItemCollectionView.register(CartItemHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CartItemHeaderCollectionReusableView.identifier)
        
        cartView.cartItemCollectionView.register(CartItemFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CartItemFooterCollectionReusableView.identifier)
    }
}

extension CartViewController {
    
    private func calculateSelectedItemPrice(seletedItem: [CartModel]) -> OrderModel {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        var sumItemPrice = 0
        var sumDiscountPrice = 0
        
        seletedItem.filter { $0.isSelect == true }.forEach { data in
            sumItemPrice += Int(data.originalPrice * Double(data.itemCount))
            sumDiscountPrice += Int(data.discountedPrice)
        }
        
        return OrderModel(itemPrice: sumItemPrice, discountedPrice: sumDiscountPrice, deliveryPrice: 0, totalPrice: sumItemPrice - sumDiscountPrice)
    }
}

extension CartViewController: SelectedItemProtocol {
    
    func getButtonState(state: Bool, row: Int) {
        if state == true {
            dummy[row].isSelect = state
            
            selectedItem.append(dummy[row])
        } else {
            dummy[row].isSelect = state
            
            if let index = selectedItem.firstIndex(where: { $0.id == row }) {
                selectedItem.remove(at: index)
            }
        }
    }
}

extension CartViewController: UpdatingStepperProtocol {
    
    func updateStepperValue(value: Int, row: Int) {
        dummy[row].itemCount = value
        print(dummy[row])
        
        if dummy[row].isSelect == true {
            if let index = selectedItem.firstIndex(where: { $0.id == row }) {
                selectedItem[index] = dummy[row]
            }
        } else {
            cartView.cartItemCollectionView.reloadData()
        }
    }
}

extension CartViewController {
    
    private func bindModel() {
        cartView.cartHeaderView.bindData(seletedItemCount: selectedItem.count, AllItemCount: dummy.count)
    }
    
    private func setTarget() {
        cartView.navigationBar.closeButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        cartView.bottomCTAButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
        
        cartView.cartHeaderView.changeAddressButton.addTarget(self, action: #selector(tapChangeAddressButton), for: .touchUpInside)
        
        cartView.cartHeaderView.selectAllItemButton.addTarget(self, action: #selector(tapSelectAllItemButton), for: .touchUpInside)
        
        cartView.cartHeaderView.selectDeleteItemButton.addTarget(self, action: #selector(tapSelectDeleteItemButton), for: .touchUpInside)
    }
}

extension CartViewController {
    
    @objc func tapBackButton() {
        if self.navigationController == nil {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func tapOrderButton() {
        print("주문하기!")
    }
    
    @objc func tapChangeAddressButton() {
        print("주소지 변경하기!")
    }
    
    @objc func tapSelectAllItemButton(_ sender: UIButton) {
        print("구매 상품 전체 선택하기!")
        
        sender.isSelected.toggle()
        
        if sender.isSelected == true {
            for i in 0..<dummy.count {
                if dummy[i].isSelect == false {
                    dummy[i].isSelect = true
                    selectedItem.append(dummy[i])
                }
            }
        } else {
            for i in 0..<dummy.count {
                dummy[i].isSelect = false
                selectedItem.removeAll()
            }
        }
    }
    
    @objc func tapSelectDeleteItemButton() {
        print("선택 상품 삭제하기!")
    }
    
    @objc func tapDeleteItemButton() {
        print("개별 상품 삭제하기!")
    }
}

extension CartViewController: UICollectionViewDelegate {}

extension CartViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return dummy.count
        case 1 :
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CartItemCollectionViewCell.identifier, for: indexPath) as? CartItemCollectionViewCell else { return UICollectionViewCell() }
            
            cell.itemDelegate = self
            cell.stepperDelegate = self
            
            cell.deleteItemButton.addTarget(self, action: #selector(tapDeleteItemButton), for: .touchUpInside)
            
            cell.bindModel(model: dummy[indexPath.row])
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderPriceCollectionViewCell.identifier, for: indexPath) as? OrderPriceCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindModel(model: calculateSelectedItemPrice(seletedItem: selectedItem))
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension CartViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: SizeLiterals.Screen.screenWidth, height: 56)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        if section == 0 {
            return CGSize(width: SizeLiterals.Screen.screenWidth, height: 8)
        } else {
            return CGSize(width: 0, height: 0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CartItemHeaderCollectionReusableView.identifier, for: indexPath) as? CartItemHeaderCollectionReusableView else { return UICollectionReusableView()}
            
            switch indexPath.section {
            case 0:
                return headerView
            default:
                return UICollectionReusableView()
            }
            
        } else if kind == UICollectionView.elementKindSectionFooter {
            guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CartItemFooterCollectionReusableView.identifier, for: indexPath) as? CartItemFooterCollectionReusableView else { return UICollectionReusableView() }
            
            switch indexPath.section {
            case 0:
                return footerView
            default:
                return UICollectionReusableView()
            }
        }
        
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: collectionView.bounds.width, height: 157)
        } else if indexPath.section == 1 {
            return CGSize(width: collectionView.bounds.width, height: 263)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 0)
        }
    }
}
