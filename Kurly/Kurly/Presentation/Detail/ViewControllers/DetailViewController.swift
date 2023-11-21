//
//  DetailViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: BaseViewController {
    
    private let navigationBar = CustomNavigationBar(type: .backCartButton)
    private let tabBarView = TabBarView()
    private let bottomCTAButton = BottomCTAButton(type: .buy)
    
    private let detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubviews(navigationBar, tabBarView, bottomCTAButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tabBarView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(100)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        bottomCTAButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(73)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-11)
        }
    }
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}
