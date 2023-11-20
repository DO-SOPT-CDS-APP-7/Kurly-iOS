//
//  AddCartViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit

class AddCartViewController: BaseViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setUI() {
        self.view.backgroundColor = .systemYellow
        self.modalPresentationStyle = .pageSheet
    }
    
    override func setLayout() {
        view.snp.makeConstraints {
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 361 / 812)
        }
    }
}
