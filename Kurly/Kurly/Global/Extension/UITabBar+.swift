//
//  UITabBar+.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import UIKit

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
