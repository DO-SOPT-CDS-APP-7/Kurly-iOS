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
    
    private let dummy = Product.dummy()
    
    weak var delegate: DismissProtocol?
    
    private let addCartView = AddCartView()
    private let afterAddCartViewController = AfterAddCartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindModel()
        setTarget()
    }
    
    override func loadView() {
        self.view = addCartView
    }
}

extension AddCartViewController {
    private func bindModel() {
        addCartView.bindModel(model: dummy)
    }
    
    private func setTarget() {
        addCartView.addCartButton.addTarget(self, action: #selector(tapAddCartButton), for: .touchUpInside)
        addCartView.stepper.minusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
        addCartView.stepper.plusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
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
        }
        else {
            addCartView.stepper.value += sender.tag
            addCartView.bindPrice(price: dummy.salePrice, value: addCartView.stepper.value)
        }
    }
}
