//
//  RelatedProductService.swift
//  Kurly
//
//  Created by 김보연 on 11/30/23.
//

import Foundation
import UIKit

final class RelatedProductService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }

    func getRelatedProductResponse(productId: Int, page: Int, size: Int) async throws -> [RelatedResponseV2]? {
        let query = RelatedFoodRequest(page: page, size: size)
        let urlRequest = try NetworkRequest(path: "product/\(productId)/related", httpMethod: .get,  query: query).makeURLRequest()
        return try await apiService.request(urlRequest)
    }

    func fetchProduct() async throws -> [RelatedModel] {
        guard let model = try await self.getRelatedProductResponse(productId: 1, page: 1, size: 6) else { throw NetworkError.badCasting }
        var relatedProductList: [RelatedModel] = []
        model.forEach {
            relatedProductList.append(RelatedModel(deliveryType: $0.deliveryType, productName: $0.productName, originalPrice: $0.originalPrice, imageURL: $0.imageURL))
        }
        return relatedProductList
    }
}
