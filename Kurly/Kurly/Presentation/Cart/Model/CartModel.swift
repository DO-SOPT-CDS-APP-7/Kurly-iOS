//
//  CartModel.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/27.
//

import UIKit

struct CartModel {
    let productName: String
    let originalPrice: Double
    let discountRate: Double
    let imageURL: String
    var isSelect: Bool = false
    var discountPrice: Int {
        return Int(originalPrice * discountRate / 100)
    }
    
    var discountedPrice: Int {
        return Int(originalPrice - Double(discountPrice)) * itemCount
    }
    
    var calculatePrice: Int {
        return Int(originalPrice * Double(itemCount))
    }

    var itemCount: Int {
        didSet {
            if itemCount < 1 {
                itemCount = 1
            }
        }
    }
}

extension CartModel {
    static func dummy() -> [CartModel] {
        return [CartModel(productName: "[시골보쌈과 감자옹심이] 감자옹심이 칼국수(2인분)",
                          originalPrice: 10500,
                          discountRate: 50,
                          imageURL: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/marketKurly/kurly1.png", itemCount: 1),
                CartModel(productName: "[올면] 속초식 명태 회냉면 2인분",
                          originalPrice: 12000,
                          discountRate: 50,
                          imageURL: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/marketKurly/kurly3.svg", itemCount: 1),
                CartModel(productName: "[광화문 미진] 메밀국수 (2인분)",
                          originalPrice: 9980,
                          discountRate: 50,
                          imageURL: "https://insopt-seminar3.s3.ap-northeast-2.amazonaws.com/marketKurly/kurly4.svg", itemCount: 1)]
    }
}

