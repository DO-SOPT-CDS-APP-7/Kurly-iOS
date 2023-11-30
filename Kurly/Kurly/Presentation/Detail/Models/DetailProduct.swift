//
//  DetailProduct.swift
//  Kurly
//
//  Created by 김보연 on 11/20/23.
//

import UIKit

struct DetailProduct {
    let image: String
    let delivery: String
    let name: String
    let description: String
    let discountRate: Int
    let salePrice: Int
    let price: Int
}

extension DetailProduct {
    static func dummy() -> DetailProduct {
        return DetailProduct(image: "",
                             delivery: "샛별배송",
                             name: "[전주 베테랑] 칼국수",
                             description: "베테랑의 대표메뉴를 집에서",
                             discountRate: 20,
                             salePrice: 4720,
                             price: 5900)
    }
}

