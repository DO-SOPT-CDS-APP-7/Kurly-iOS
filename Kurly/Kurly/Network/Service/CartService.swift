//
//  CartService.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

final class CartService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }
    
    func getFreeShippingResponse(xAuthId: Int) async throws -> Int? {
        let urlRequest = try NetworkRequest(path: "cart/free-shipping", httpMethod: .get, header: ["X-Auth-id": "\(xAuthId)"]).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
    func fetchFreeShipping(xAuthId: Int) async throws -> Int {
        guard let model = try await self.getFreeShippingResponse(xAuthId: xAuthId)
        else { throw NetworkError.badCasting }
        return model
    }
}
