//
//  CartCheckService.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/29.
//

import Foundation

final class CartCheckService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }
    
    func getCartResponse(xAuthId: Int) async throws -> [CartResponse]? {
        let urlRequest = try NetworkRequest(path: "/cart", httpMethod: .get, header: ["X-Auth-id": "\(xAuthId)"]).makeURLRequest()
        
        return try await apiService.request(urlRequest)
    }
    
    func fetchCart(xAuthId: Int) async throws -> [CartModel] {
        guard let model = try await self.getCartResponse(xAuthId: xAuthId) else {
            throw NetworkError.badCasting
        }
        
        return createCartModelData(cartData: model)
    }
    
    func createCartModelData(cartData: [CartResponse]) -> [CartModel] {
        
        var cartModelData: [CartModel] = []
        
        cartData.forEach { data in
            cartModelData.append(CartModel(productName: data.productName, originalPrice: Double(data.price), discountRate: Double(data.discountRate), imageURL: data.imageURL, itemCount: data.count))
        }
        
        return cartModelData
    }
}
