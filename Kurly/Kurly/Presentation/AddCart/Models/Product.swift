//
//  Product.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

struct Product {
    let id: Int
    let image: UIImage
    let name: String
    let description: String
    let salePrice: Int
    let price: Int
}

extension Product {
    static func dummy() -> Product {
        return Product(id: 0,
                       image: ImageLiterals.addCart.smallCart,
                       name: "[전주 베테랑] 칼국수",
                       description: "베테랑의 대표메뉴를 집에서",
                       salePrice: 4720,
                       price: 5900)
    }
}

