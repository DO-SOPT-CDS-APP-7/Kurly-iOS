//
//  String+.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import UIKit

extension String {
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isOnlyKorean() -> Bool {
        let pattern = "[가-힣]"
        guard self.range(of: pattern, options: .regularExpression) != nil else { return false }
        return true
    }
    
    func size(OfFont font: UIFont) -> CGSize {
        let size = (self as NSString).size(withAttributes: [.font: font])
        let buffer = 0.2
        return CGSize(width: size.width + buffer, height: size.height)
    }
    
    func getEstimatedFrame(with font: UIFont) -> CGRect {
        let size = CGSize(width: UIScreen.main.bounds.width * 2/3, height: 1000)
        let optionss = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: self).boundingRect(with: size, options: optionss, attributes: [.font: font], context: nil)
        return estimatedFrame
    }
    
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
