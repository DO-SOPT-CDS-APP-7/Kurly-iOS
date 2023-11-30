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
    
    func makePostCartUrlRequest(xAuthId: Int, model: CartRequest) async throws -> URLRequest {
        let param = model.toDictionary()
        let body = try JSONSerialization.data(withJSONObject: param)
        return try NetworkRequest(path: "cart", httpMethod: .post, body: body, header: ["X-Auth-id": "\(xAuthId)"]).makeURLRequest()
    }
    
    
    func fetchFreeShipping(xAuthId: Int) async throws -> Int {
        guard let model = try await self.getFreeShippingResponse(xAuthId: xAuthId)
        else { throw NetworkError.badCasting }
        return model
    }
    
    func addCart(xAuthId: Int, productId: Int, count: Int) async throws -> Int? {
        let request = try await self.makePostCartUrlRequest(xAuthId: xAuthId, model: CartRequest(productId: "\(productId)", count: "\(count)"))
        print(productId, count, "😊😊😊😊😊😊😊😊😊")
        return try await apiService.request(request)
    }
}
