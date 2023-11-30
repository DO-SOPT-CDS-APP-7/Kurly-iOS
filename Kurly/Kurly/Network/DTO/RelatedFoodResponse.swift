//
//  RelatedFoodResponse.swift
//  Kurly
//
//  Created by 강민수 on 11/30/23.
//

import Foundation

struct RelatedFoodResponse: Response {
    let deliveryType: String
    let productName: String
    let originalPrice: Int
    let imageURL: String?
}

struct RelatedFoodRequest: Request {
    let page: Int
    let size: Int
}
