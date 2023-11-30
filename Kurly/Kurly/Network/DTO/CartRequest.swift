//
//  CartRequest.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/29/23.
//

import Foundation

struct CartRequest: Request {
    let productId: String
    let count: String
}
