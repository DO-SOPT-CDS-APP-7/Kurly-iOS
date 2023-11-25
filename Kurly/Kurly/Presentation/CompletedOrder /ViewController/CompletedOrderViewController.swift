//
//  CompletedOrderViewController.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/24.
//

import UIKit

class CompletedOrderViewController: BaseViewController {

    private let completedOrderView = CompletedOrderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    override func loadView() {
        self.view = completedOrderView
    }
    
    override func setUI() {
        self.view.backgroundColor = .white
    }
}

extension CompletedOrderViewController {
    
    private func setTarget() {
        completedOrderView.orderDetailCTAButton.addTarget(self, action: #selector(tapOrderDetailCTAButton), for: .touchUpInside)
        
        completedOrderView.shoppingCTAButton.addTarget(self, action: #selector(tapShoppingCTAButton), for: .touchUpInside)
    }
}

extension CompletedOrderViewController {
    
    @objc func tapOrderDetailCTAButton() {
        print("주문 상세보기!")
    }
    
    @objc func tapShoppingCTAButton() {
        print("쇼핑 계속하기!")
    }
}
