//
//  RelatedModel.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/23/23.
//

import UIKit

struct RelatedModel {
    let deliveryType: String
    let productName: String
    let originalPrice: Int
    let imageURL: String
}

extension RelatedModel {
    static func dummy() -> [RelatedModel] {
        return [RelatedModel(deliveryType: "샛별배송",
                             productName: "[시골보쌈과 감자옹심이 감자",
                             originalPrice: 5900,
                             imageURL: "ImageLiterals.Home.img.activityTop01"),
                RelatedModel(deliveryType: "샛별배송",
                             productName: "[시골보쌈과 감자옹심이 감자",
                             originalPrice: 5900,
                             imageURL: "ImageLiterals.Home.img.activityTop02"),
                RelatedModel(deliveryType: "샛별배송",
                             productName: "[시골보쌈과 감자옹심이 감자",
                             originalPrice: 5900,
                             imageURL: "ImageLiterals.Home.img.activityTop03")]
    }
}

