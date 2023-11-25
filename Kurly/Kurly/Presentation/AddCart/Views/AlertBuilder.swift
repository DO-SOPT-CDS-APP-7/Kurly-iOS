//
//  AlertBuilder.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/25/23.
//

import UIKit

struct AddAction {
    var text: String?
    var action: (() -> Void)?
}

final class AlertBuilder {
    
    private let baseViewController: UIViewController
    private let alertViewController = CustomAlertViewController()
    
    private var alertTitle: String?
    private var message: String?
    private var addActionConfirm: AddAction?
    init(viewController: UIViewController) {
        baseViewController = viewController
    }
    
    func setTitle(_ text: String) -> AlertBuilder {
        alertTitle = text
        return self
    }
    
    func setMessage(_ text: String) -> AlertBuilder {
        message = text
        return self
    }
    
    func addActionConfirm(_ text: String, action: (() -> Void)? = nil) -> AlertBuilder {
        addActionConfirm = AddAction(text: text, action: action)
        return self
    }
    
    func show() -> Self {
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        
        alertViewController.alertTitle = alertTitle
        alertViewController.message = message
        alertViewController.addActionConfirm = addActionConfirm
        
        baseViewController.present(alertViewController, animated: true)
        return self
    }
}
