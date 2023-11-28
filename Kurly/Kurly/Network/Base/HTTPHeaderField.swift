//
//  HTTPHeaderField.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "Application/json"
}
