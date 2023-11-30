//
//  AfterAddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

final class AfterAddCartViewController: BaseViewController {
    
    private let afterAddCartView = AfterAddCartView()
    
    private let dummy = RelatedModel.dummy()
    
    private let cartService = CartService(apiService: APIService().self)
    private var price: Int = 10000
    
    override func loadView() {
        self.view = afterAddCartView
    }

    override func viewDidLoad() {
        print("🍎🍎🍎🍎🍎🍎🍎🍎🍎모달2🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎🍎")
        super.viewDidLoad()
        bindModel()
        setTarget()
        getFreeShipping()
    }
}

extension AfterAddCartViewController {
    
    private func bindModel() {
        afterAddCartView.bindPrice(buyPrice: price)
    }
    
    private func setTarget() {
        afterAddCartView.buyButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    private func getFreeShipping() {
        Task {
            do {
                let result = try await cartService.fetchFreeShipping(xAuthId: 1)
                price = result
                self.afterAddCartView.bindPrice(buyPrice: price)
                
            }
            catch {
                guard let error = error as? NetworkError else { return }
                print(error.description)
            }
        }
    }
}

extension AfterAddCartViewController {
    
    @objc func tapButton() {
        print("tapButton")
    }
}
