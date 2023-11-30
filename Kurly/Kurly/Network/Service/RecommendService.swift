//
//  RecommendService.swift
//  Kurly
//
//  Created by 강민수 on 11/30/23.
//

import Foundation

final class RecommendService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }

    func getRecommendResponse(productId: Int) async throws -> [RecommendResponse]? {
        let urlRequest = try NetworkRequest(path: "product/\(productId)/recommend", httpMethod: .get).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
    func fetchProduct() async throws -> [RelatedModel] {
        guard let model = try await self.getRecommendResponse(productId: 1) else { throw NetworkError.badCasting }
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
