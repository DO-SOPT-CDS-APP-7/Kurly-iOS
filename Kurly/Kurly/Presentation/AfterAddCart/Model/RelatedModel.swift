//
//  RelatedModel.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/23/23.
//

import UIKit

struct RelatedModel {
    let id: Int
    let image: UIImage
    let shipping: String
    let name: String
    let price: Int
}

extension RelatedModel {
    static func dummy() -> [RelatedModel] {
        return [RelatedModel(id: 0,
                             image: ImageLiterals.Home.img.activityTop01,
                             shipping: "샛별배송",
                             name: "[시골보쌈과 감자옹심이 감자",
                             price: 5900),
                RelatedModel(id: 1,
                             image: ImageLiterals.Home.img.activityTop02,
                             shipping: "샛별배송",
                             name: "[시골보쌈과 감자옹심이 감자",
                             price: 5900),
                RelatedModel(id: 2,
                             image: ImageLiterals.Home.img.activityTop03,
                             shipping: "샛별배송",
                             name: "[시골보쌈과 감자옹심이 감자",
                             price: 5900)]
    }
}

