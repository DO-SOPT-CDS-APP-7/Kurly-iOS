//
//  CartViewController.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/20.
//

import UIKit

import SnapKit
import Kingfisher
import Combine

enum CartViewType {
    case emptyCart
    case order
}

final class CartViewController: BaseViewController {
    
    private var cartView = CartView(type: .order)
    private var cartCheckService = CartCheckService(apiService: APIService().self)
    private var cartResetService = CartResetService(apiService: APIService().self)
    
    private let selectedButtonTap = PassthroughSubject<(Bool, Int), Never>()
    private let allSelectedButtonTap = PassthroughSubject<Bool, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    private let viewModel = CartViewModel()
    private var totalPrice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
        bindViewModel()
    }
    
    override func loadView() {
        self.view = self.cartView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getCartItem()
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
        CartItemHeaderCollectionReusableView.registerHeaderView(to: cartView.cartItemCollectionView)
        CartItemFooterCollectionReusableView.registerFooterView(to: cartView.cartItemCollectionView)
    }
}

extension CartViewController {
    
    private func calculateSelectedItemPrice(seletedItem: [CartModel]) -> OrderModel {
        let numberFormatter: NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        var sumItemPrice = 0
        var sumTotalPrice = 0
        var sumDiscountPrice = 0
        
        seletedItem.filter { $0.isSelect == true }.forEach { data in
            sumItemPrice += Int(data.originalPrice * Double(data.itemCount))
            sumDiscountPrice += Int(Double(data.discountPrice) * Double(data.itemCount))
            sumTotalPrice += Int(data.discountedPrice)
        }
        
        self.totalPrice = sumTotalPrice
        
        return OrderModel(itemPrice: sumItemPrice, discountPrice: sumDiscountPrice, deliveryPrice: 0, totalPrice: sumTotalPrice)
    }
    
    private func getCartItem() {
        Task {
            do {
                let result = try await cartCheckService.fetchCart(xAuthId: 1)

                viewModel.cartItemData = result
                viewModel.selectedItem.removeAll()
                
                if result.isEmpty {
                    cartView.cartType = .emptyCart
                } else {
                    cartView.cartType = .order
                }
            } catch {
                guard let error = error as? NetworkError else { return }
                print(error.description)
            }
        }
    }
}

extension CartViewController: SelectedItemProtocol {
    
    func getButtonState(state: Bool, row: Int) {
        selectedButtonTap.send((state, row))
    }
}

extension CartViewController: UpdatingStepperProtocol {
    
    func updateStepperValue(value: Int, row: Int) {
        viewModel.cartItemData[row].itemCount = value
        
        if viewModel.cartItemData[row].isSelect == true {
            if let index = viewModel.selectedItem.firstIndex(where: { $0.productName == viewModel.cartItemData[row].productName }) {
                viewModel.selectedItem[index] = viewModel.cartItemData[row]
            }
        } else {
            cartView.cartItemCollectionView.reloadData()
        }
    }
}

extension CartViewController {
    
    func bindViewModel() {
        viewModel.$cartItemData.combineLatest(viewModel.$selectedItem)
            .sink { [weak self] cartItems, selectedItems in
                self?.cartView.cartHeaderView.allSelectedItemView.bindData(seletedItemCount: selectedItems.count, AllItemCount: cartItems.count)
                self?.cartView.cartItemCollectionView.reloadData()
            }
            .store(in: &cancellables)
        
        viewModel.$selectedItem
            .sink { [weak self] data in
                let result = self?.calculateSelectedItemPrice(seletedItem: data)
                self?.cartView.bindPrice(totalPrice: result?.totalPrice ?? 0)
                
                self?.cartView.cartItemCollectionView.reloadData()
            }
            .store(in: &cancellables)

    
        viewModel.transformButtonState(input: self.selectedButtonTap.eraseToAnyPublisher())
        
        viewModel.transformSelectButton(input: self.allSelectedButtonTap.eraseToAnyPublisher())
        
//        viewModel.transformSteeper(input: self.stepperButtonTap.eraseToAnyPublisher())
    }
    
    private func setTarget() {
        cartView.navigationBar.closeButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        cartView.bottomCTAButton.addTarget(self, action: #selector(tapOrderButton), for: .touchUpInside)
        
        cartView.cartHeaderView.cartAddressView.changeAddressButton.addTarget(self, action: #selector(tapChangeAddressButton), for: .touchUpInside)
        
        cartView.cartHeaderView.allSelectedItemView.selectAllItemButton.addTarget(self, action: #selector(tapSelectAllItemButton), for: .touchUpInside)
        
        cartView.cartHeaderView.allSelectedItemView.selectDeleteItemButton.addTarget(self, action: #selector(tapSelectDeleteItemButton), for: .touchUpInside)
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
        
        Task {
            do {
                let result = try await cartResetService.fetchResetCart(xAuthId: 1)
                
                if result.message == "완료" {
                    let nextViewController = CompletedOrderViewController()
                    
                    await MainActor.run {
                        navigationController?.pushViewController(nextViewController, animated: true)
                        
                        nextViewController.completedOrderView.bindData(orderPrice: totalPrice)
                    }
                }
            } catch {
                guard let error = error as? NetworkError else { return }
                print(error.description)
            }
        }
    }
    
    @objc func tapChangeAddressButton() {
        print("주소지 변경하기!")
    }
    
    @objc func tapSelectAllItemButton(_ sender: UIButton) {
        print("구매 상품 전체 선택하기!")
        
        sender.isSelected.toggle()
        allSelectedButtonTap.send(sender.isSelected)
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
            return viewModel.cartItemData.count
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
            
            cell.bindModel(model: viewModel.cartItemData[indexPath.row], row: indexPath.row)
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderPriceCollectionViewCell.identifier, for: indexPath) as? OrderPriceCollectionViewCell else { return UICollectionViewCell() }
            
            cell.bindModel(model: calculateSelectedItemPrice(seletedItem: viewModel.selectedItem))
            
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

extension CartViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        self.cartView.updateView(forScrollOffset: yOffset)
        self.view.layoutIfNeeded()
    }
}
