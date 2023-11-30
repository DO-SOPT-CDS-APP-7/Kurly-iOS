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

    func getRelatedProductResponse(productId: Int) async throws -> RelatedResponse? {
        let urlRequest = try NetworkRequest(path: "product/\(productId)/related", httpMethod: .get).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
//    func stringToImage(imageURL: String) async throws -> UIImage {
//        do {
//            guard let image = try await KingfisherService.fetchImage(with: imageURL) else { throw NetworkError.badCasting }
//            return image
//        } catch {
//            throw error
//        }
//    }
    
    func fetchProduct() async throws -> [RelatedModel] {
        guard let model = try await self.getRelatedProductResponse(productId: 1) else { throw NetworkError.badCasting }
//        let image = try await stringToImage(imageURL: model.imageURL)
        guard let image = try await KingfisherService.fetchImage(with: model.imageURL) else {
                    throw NetworkError.badCasting
                }
        return [RelatedModel(deliveryType: model.deliveryType, productName: model.productName, originalPrice: model.originalPrice, imageURL: image)]
    }
}
