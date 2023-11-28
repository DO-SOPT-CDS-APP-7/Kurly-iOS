//
//  HTTPMethod.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import UIKit

enum HttpMethod: String {
    case `get`
    case post
    case put
    case patch
    case delete

    var rawValue: String {
        switch self {
        case .get: return "GET"
        case .post: return "POST"
        case .put: return "PUT"
        case .patch: return "PATCH"
        case .delete: return "DELETE"
        }
    }
}
