//
//  DetailViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit


import SnapKit
import Then

final class DetailViewController: UIViewController {
    private let navigationBar = CustomNavigationBar(type: .backCartButton)
    private let tabBarView = TabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubviews(navigationBar, tabBarView)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tabBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(45)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
