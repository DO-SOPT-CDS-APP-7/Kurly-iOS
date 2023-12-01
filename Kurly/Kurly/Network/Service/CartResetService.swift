//
//  CartResetService.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/12/01.
//

import Foundation

class CartResetService {
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }
    
    func deleteCartResponse(xAuthId: Int) async throws -> CartResetResponse? {
        let urlRequeset = try NetworkRequest(path: "/cart", httpMethod: .delete, header: ["X-Auth-id": "\(xAuthId)"]).makeURLRequest()
        
        return try await apiService.request(urlRequeset)
    }
    
    func fetchResetCart(xAuthId: Int) async throws -> CartResetResponse {
        guard let model = try await self.deleteCartResponse(xAuthId: xAuthId) else {
            throw NetworkError.badCasting
        }
        print(model)
        return model
    }

}
