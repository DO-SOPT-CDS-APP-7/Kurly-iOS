//
//  KingfisherService.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import UIKit

import Kingfisher


final class KingfisherService {

    static func fetchImage(with urlString: String) async throws -> UIImage? {
        typealias ImageContinuation = CheckedContinuation<UIImage?, Error>

        return try await withCheckedThrowingContinuation { ImageContinuation in

            guard let url = URL(string: urlString) else {
                return ImageContinuation.resume(throwing: NetworkError.urlEncodingError)
            }
            
            let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
            KingfisherManager.shared.retrieveImage(with: resource) { result in
                switch result {
                case .success(let imageResult):
                    let image = imageResult.image
                    return ImageContinuation.resume(returning: image)
                case .failure(_):
                    return ImageContinuation.resume(throwing: NetworkError.fetchImageError)
                }
            }
        }
        
    }

    func unwrapTaskArray<T>(dataTasks: [Task<T, Never>], type: T.Type) async -> [T] {
        let tasks = dataTasks.map { task in
            Task {
                return try await task.result.get()
            }
        }

        var result: [T?] = []
        for task in tasks {
            result.append(try? await task.result.get())
        }
        return result.compactMap { $0 }
    }

}
