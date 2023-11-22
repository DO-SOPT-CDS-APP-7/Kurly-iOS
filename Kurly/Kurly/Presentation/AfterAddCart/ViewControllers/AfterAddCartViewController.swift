//
//  AfterAddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit

final class AfterAddCartViewController: BaseViewController {
    
    private var price: Int = 10000
    
    private let afterAddCartView = AfterAddCartView()
    
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
        print("헤헤")
    }
}
