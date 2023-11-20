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
    }
    
    override func loadView() {
        self.view = addCartView
    }
}

extension AddCartViewController {
    private func bindModel() {
        addCartView.bindModel(model: dummy)
    }
}
