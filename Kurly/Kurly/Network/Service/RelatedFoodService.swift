//
//  RelatedFoodService.swift
//  Kurly
//
//  Created by 강민수 on 11/30/23.
//

import Foundation

final class RelatedFoodService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }

    func getRelatedFoodResponse(productId: Int, page: Int, size: Int) async throws -> [RelatedFoodResponse]? {
        let query = RelatedFoodRequest(page: 1, size: 3)
        let urlRequest = try NetworkRequest(path: "product/\(productId)/related", httpMethod: .get, query: query).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
    func fetchProduct() async throws -> [RelatedModel] {
        guard let model = try await self.getRelatedFoodResponse(productId: 1, page: 1, size: 3) else { throw NetworkError.badCasting }
        var relatedModelList: [RelatedModel] = []
        model.forEach {
            relatedModelList.append(RelatedModel(deliveryType: $0.deliveryType,
                                                 productName: $0.productName,
                                                 originalPrice: $0.originalPrice,
                                                 imageURL: $0.imageURL ?? ""))
        }
        
        return relatedModelList
    }
}
