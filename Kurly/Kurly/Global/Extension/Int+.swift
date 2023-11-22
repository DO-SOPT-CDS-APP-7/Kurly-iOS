//
//  Int+.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/22/23.
//

import Foundation

extension Int {
    
    var priceText: String {
        get {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            
            var priceString = numberFormatter.string(for: self) ?? "-1"
            priceString = priceString + "원"
            return priceString
        }
    }
}
