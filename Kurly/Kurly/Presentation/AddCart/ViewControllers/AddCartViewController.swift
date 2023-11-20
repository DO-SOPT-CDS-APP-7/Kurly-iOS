//
//  AddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit

final class AddCartViewController: BaseViewController {
    
    private let dummy = Product.dummy()
    
    private let addCartView = AddCartView()
    
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
        addCartView.addCartButton.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        
        addCartView.stepper.minusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
        
        addCartView.stepper.plusButton.addTarget(self, action: #selector(updateValue(_:)), for: .touchUpInside)
    }
}

extension AddCartViewController {
    @objc func tapButton() {
        print("\(addCartView.stepper.value)")
        self.dismiss(animated: true)
        print("설마되나?")
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
