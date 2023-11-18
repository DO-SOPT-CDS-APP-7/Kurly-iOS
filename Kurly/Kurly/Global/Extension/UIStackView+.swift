//
//  UIStackView+.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import UIKit

extension UIStackView {
    
     func addArrangedSubviews(_ views: UIView...) {
         for view in views {
             self.addArrangedSubview(view)
         }
     }
}
