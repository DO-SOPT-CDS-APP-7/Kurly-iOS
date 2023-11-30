//
//  NetworkRequest.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

struct NetworkRequest {
    let path: String
    let httpMethod: HttpMethod
    let query: Request?
    let body: Data?
    let header: [String: String]?

    init(path: String, httpMethod: HttpMethod, query: Request? = nil, body: Data? = nil, header: [String : String]? = nil) {
        self.path = path
        self.httpMethod = httpMethod
        self.query = query
        self.body = body
        self.header = header
    }

    func makeURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: Config.baseURL)

        if let query = self.query {
            let queries = query.toDictionary()
            let queryItemArray = queries.map {
                return URLQueryItem(name: $0.key, value: "\($0.value)")
            }
            urlComponents?.queryItems = queryItemArray
        }
        
        guard let urlRequestURL = urlComponents?.url?.appendingPathComponent(self.path) else {
            throw NetworkError.urlEncodingError
        }
        
        var urlRequest = URLRequest(url: urlRequestURL)
        urlRequest.httpMethod = self.httpMethod.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if(header != nil) {
            urlRequest.addValue(header?["X-Auth-id"] ?? "" , forHTTPHeaderField: "X-Auth-id")
        }
        
        urlRequest.httpBody = self.body
        
        return urlRequest
    }
}
