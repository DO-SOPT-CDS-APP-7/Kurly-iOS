//
//  ProductService.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

final class ProductService {
    
    private let apiService: Requestable
    
    init(apiService: Requestable) {
        self.apiService = apiService
    }

    func getProductResponse(productId: Int) async throws -> ProductResponse? {
        let urlRequest = try NetworkRequest(path: "product/\(productId)", httpMethod: .get).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
    func getRelatedResponse(productId: Int, page: Int, size: Int) async throws -> [RelatedResponse]? {
        let urlRequest = try NetworkRequest(path: "product/\(productId)/related", httpMethod: .get, query: RelatedRequest(page: page, size: size)).makeURLRequest()
        return try await apiService.request(urlRequest)
    }
    
    func fetchProduct(productId: Int) async throws -> Product {
        guard let model = try await self.getProductResponse(productId: productId) else { throw NetworkError.badCasting }
        return Product(image: model.imageURL ?? "", name: model.productName, description: "베테랑의 대표메뉴를 집에서", salePrice: Int(Double(model.originalPrice) - Double(model.originalPrice * model.discountRate) * 0.01), price: model.originalPrice)
    }
    
    func mainFoodProduct() async throws -> DetailProduct {
        guard let model = try await self.getProductResponse(productId: 1) else { throw NetworkError.badCasting }
        return DetailProduct(image: model.imageURL ?? "", delivery: model.deliveryType, name: model.productName, description: "베테랑의 대표메뉴를 집에서", discountRate: model.discountRate, salePrice: Int(Double(model.originalPrice * model.discountRate) * 0.01), price: model.originalPrice)
    }
    
    func fetchRelated(productId: Int, page: Int, size: Int) async throws -> [RelatedModel] {
        guard let model = try await self.getRelatedResponse(productId: productId, page: page, size: size) else { throw NetworkError.badCasting }
        var returnModel: [RelatedModel] = []
        model.forEach {
            returnModel.append(RelatedModel(deliveryType: $0.deliveryType, productName: $0.productName, originalPrice: $0.originalPrice, imageURL: $0.imageURL ?? ""))
        }
        return returnModel
    }
}
