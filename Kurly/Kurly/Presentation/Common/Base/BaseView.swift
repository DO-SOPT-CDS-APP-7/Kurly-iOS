//
//  BaseView.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

class BaseView: UIView {

    private lazy var viewName = self.className
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        print("🧵 \(viewName) has been successfully Removed")
    }
    
    /// View 의 Style 을 set 합니다.
    func setUI() {}
    /// View 의 Layout 을 set 합니다.
    func setLayout() {}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
