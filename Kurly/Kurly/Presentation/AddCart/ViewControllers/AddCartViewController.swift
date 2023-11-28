//
//  AddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit

protocol DismissProtocol: AnyObject {
    func tapButton()
}

final class AddCartViewController: BaseViewController {
    
    private let productService = ProductService(apiService: APIService().self)
    private var productModel = Product(image: "", name: "", description: "", salePrice: 0, price: 0)
    
    weak var delegate: DismissProtocol?
    
    private let addCartView = AddCartView()
    private let afterAddCartViewController = AfterAddCartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
        getProduct()
    }
    
    override func loadView() {
        self.view = addCartView
    }
}

extension AddCartViewController {
    
    private func setTarget() {
        addCartView.addCartButton.addTarget(self, action: #selector(tapAddCartButton), for: .touchUpInside)
        addCartView.stepper.minusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
        addCartView.stepper.plusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
    }
    
    private func getProduct() {
        Task {
            do {
                let result = try await productService.fetchProduct()
                productModel = result
                self.addCartView.bindModel(model: productModel)
                
            }
            catch {
                guard let error = error as? NetworkError else { return }
                print(error.description)
            }
        }
    }
}

extension AddCartViewController {
    
    @objc func tapAddCartButton() {
        print("\(addCartView.stepper.value)")
        self.dismiss(animated: true)
        delegate?.tapButton()
    }
    
    @objc func updateValue(_ sender: UIButton) {
        if(addCartView.stepper.value == 1 && sender.tag == -1) {
            print("최소구매수량 1")
            AlertBuilder(viewController: self)
                .setTitle("알림")
                .setMessage("최소 구매수량은 1개 입니다.")
                .addActionConfirm("확인")
                .show()
            
        }
        else {
            addCartView.stepper.value += sender.tag
            addCartView.bindPrice(salePrice: productModel.salePrice, price: productModel.price, value: addCartView.stepper.value)
        }
    }
}
