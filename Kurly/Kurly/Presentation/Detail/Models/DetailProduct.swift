//
//  DetailProduct.swift
//  Kurly
//
//  Created by 김보연 on 11/20/23.
//

import UIKit

struct DetailProduct {
    let id: Int
    let image: UIImage
    let delivery: String
    let name: String
    let description: String
    let salePercent: String
    let salePrice: Int
    let price: Int
}

extension DetailProduct {
    static func dummy() -> DetailProduct {
        return DetailProduct(id: 0,
                             image: ImageLiterals.Home.img.large,
                             delivery: "샛별배송",
                             name: "[전주 베테랑] 칼국수",
                             description: "베테랑의 대표메뉴를 집에서",
                             salePercent: "20%",
                             salePrice: 4720,
                             price: 5900)
    }
}

