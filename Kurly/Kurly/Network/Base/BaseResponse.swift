//
//  BaseResponse.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

typealias Request = Encodable
typealias Response = Decodable

struct BaseResponse<T: Response>: Response {
    let status: String
    let message: String
    let data: T?
}
