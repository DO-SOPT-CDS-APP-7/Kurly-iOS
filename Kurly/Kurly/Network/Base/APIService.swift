//
//  APIService.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

protocol Requestable {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T?
}

final class APIService: Requestable {
    func request<T: Decodable>(_ request: URLRequest) async throws -> T? {
        let (data, response) = try await URLSession.shared.data(for: request)
        let decoder = JSONDecoder()
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.fetchImageError
        }
        
        let status = httpResponse.statusCode
        
        if status == 204 {
            return CartResetResponse(message: "완료") as? T
        } else {
            guard let decodedData = try? decoder.decode(BaseResponse<T>.self, from: data) else {
                throw NetworkError.jsonDecodingError
            }
            
            let statusCode = decodedData.status
            guard !NetworkErrorCode.clientErrorCode.contains(statusCode) else {
                throw NetworkError.clientError(code: decodedData.status, message: decodedData.message)
            }
            
            guard !NetworkErrorCode.serverErrorCode.contains(statusCode) else {
                throw NetworkError.serverError
            }
            
            print("🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀API호출성공🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀🍀")
            print(decodedData)
            return decodedData.data
        }
    }
}
