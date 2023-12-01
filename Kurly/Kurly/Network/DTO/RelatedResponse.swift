//
//  RelatedResponse.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/30/23.
//

import UIKit

struct RelatedResponse: Response {
    let deliveryType: String
    let productName: String
    let originalPrice: Int
    let imageURL: String?
}
