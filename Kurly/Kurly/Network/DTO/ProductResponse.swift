//
//  ProductResponse.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import UIKit

struct ProductResponse: Response {
    let deliveryType: String
    let productName: String
    let discountRate: Int
    let originalPrice: Int
    let discountedPrice: String?
    let sellerName: String
    let imageURL: String?
}
