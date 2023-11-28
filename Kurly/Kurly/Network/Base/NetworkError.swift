//
//  NetworkError.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

@frozen
enum NetworkError: Error, CustomStringConvertible {
    case urlEncodingError
    case jsonDecodingError
    case badCasting
    case fetchImageError
    case unAuthorizedError
    case clientError(code: String, message: String)
    case serverError
    
    var description: String {
        switch self {
        case .urlEncodingError:
            return "🔒URL Encoding Error"
        case .jsonDecodingError:
            return "🔐JSON Decoding Error"
        case .badCasting:
            return "❌Bad Casting (HTTPResponse)"
        case .fetchImageError:
            return "🌠FetchImageError"
        case .unAuthorizedError:
            return "🚪UnAuthorized Error"
        case .clientError(let code, let message):
            return "📱Client Error code: \(code), message:\(message)"
        case .serverError:
            return "🖥️Server Error"
        }
    }
}
