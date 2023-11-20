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
    }
    
    override func loadView() {
        self.view = cartView
    }
}

extension CartViewController {
    
    private func setTarget(){
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
