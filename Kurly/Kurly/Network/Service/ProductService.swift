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
    
    func fetchProduct() async throws -> Product {
        guard let model = try await self.getProductResponse(productId: 1) else { throw NetworkError.badCasting }
        return Product(image: model.imageURL ?? "", name: model.productName, description: "베테랑의 대표메뉴를 집에서", salePrice: Int(Double(model.originalPrice) - Double(model.originalPrice * model.discountRate) * 0.01), price: model.originalPrice)
    }
    
    func mainFoodProduct() async throws -> DetailProduct {
        guard let model = try await self.getProductResponse(productId: 1) else { throw NetworkError.badCasting }
        return DetailProduct(image: model.imageURL ?? "", delivery: model.deliveryType, name: model.productName, description: "베테랑의 대표메뉴를 집에서", discountRate: model.discountRate, salePrice: Int(Double(model.originalPrice * model.discountRate) * 0.01), price: model.originalPrice)
    }
}
