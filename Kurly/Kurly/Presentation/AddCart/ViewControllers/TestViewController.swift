//
//  TestViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import SnapKit

///  나중에 상세보기뷰에 연결해주기 위해 임시로 만든 ViewController입니다. 추후 삭제 예정.
class TestViewController: BaseViewController {
    
    private let button = BottomCTAButton(type: .buy)
    private let addCartViewController = AddCartViewController()
    private let afterAddCartViewController = AfterAddCartViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTarget()
    }
    
    override func setUI() {
        view.backgroundColor = .white
    }
    
    override func setLayout() {
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(73)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-11)
        }
    }
}

extension TestViewController {
    
    private func setTarget() {
        button.addTarget(self, action: #selector(presentaddCartViewController), for: .touchUpInside)
    }
   
    @objc private func presentaddCartViewController() {
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            return 361
        }
        
        if let sheet = addCartViewController.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        addCartViewController.delegate = self
        present(addCartViewController, animated: true, completion: nil)
    }
    
    private func presentAfterAddCartViewController() {
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            return 495
        }
        
        if let sheet = afterAddCartViewController.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        present(afterAddCartViewController, animated: true, completion: nil)
    }
}

extension TestViewController: DismissProtocol {
    
    func tapButton() {
        presentAfterAddCartViewController()
    }
}
