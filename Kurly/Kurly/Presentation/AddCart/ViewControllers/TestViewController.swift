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
    private let modalViewController = AddCartViewController()
    
    override func viewDidLoad() {
        setUI()
        setLayout()
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
        button.addTarget(self, action: #selector(presentModalBtnTap), for: .touchUpInside)
    }
   
    @objc private func presentModalBtnTap() {
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            // safe area bottom을 구하기 위한 선언.
            let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            let safeAreaBottom = windowScene?.windows.first?.safeAreaInsets.bottom ?? 0

            // ✅ 모든 기기에서 항상 높이가 600인 detent를 만들어낼 수 있다.
            return 361
        }
        
        if let sheet = modalViewController.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        
        present(modalViewController, animated: true, completion: nil)
    }
    
}
