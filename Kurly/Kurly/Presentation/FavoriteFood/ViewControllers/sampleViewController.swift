//
//  sampleViewController.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class sampleViewController: BaseViewController {
    
    private let favoriteButton = UIButton()
    private let notifyRemoveToastView = NotifyRemoveToastView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    /// View 의 Style 을 set 합니다.
    override func setUI() {
        view.backgroundColor = .white
        
        favoriteButton.do {
            $0.backgroundColor = .red
        }
    }
    /// View 의 Layout 을 set 합니다.
    override func setLayout() {
        view.addSubviews(favoriteButton, notifyRemoveToastView)
        
        favoriteButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.size.equalTo(44)
        }
        
        notifyRemoveToastView.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
    }
    
    @objc private func favoriteButtonTapped() {
        //찜 삭제했을 때
        notifyRemoveToastView.viewToastView()
        
        let relatedFoodModalViewController = RelatedFoodModalViewController()
        relatedFoodModalViewController.modalPresentationStyle = .automatic
        self.present(relatedFoodModalViewController, animated: true)
    }
    
    /// View 의 Delegate 을 set 합니다.
    override func setDelegates() {}
    /// View 의 Register 를 set 합니다.
    override func setRegister() {}
    
}
