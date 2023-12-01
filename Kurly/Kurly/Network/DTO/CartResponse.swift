//
//  CartResponse.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/29.
//

import Foundation

struct CartResponse: Response {
    let deliveryType: String
    let productName: String
    let price: Int
    let discountRate: Int
    let imageURL: String
    let count: Int
}
