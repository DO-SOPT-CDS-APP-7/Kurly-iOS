//
//  NetworkErrorCode.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation


enum NetworkErrorCode {
    static let clientErrorCode = [
        "V001", "V002", "V003", "V004",
        "F001",
        "U001",
        "N001", "N002", "N003", "N004", "N005", "N006",
        "C001", "C002", "C003"
    ]
    static let unauthorizedErrorCode = "U001"
    static let resignedErrorCode = "N002"
    static let serverErrorCode = ["I001", "B001"]
}
