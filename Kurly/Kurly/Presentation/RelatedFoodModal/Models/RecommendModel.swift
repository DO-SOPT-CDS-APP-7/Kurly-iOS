//
//  RecommendModel.swift
//  Kurly
//
//  Created by 강민수 on 11/22/23.
//

import Foundation
import UIKit

struct RecommendModel {
    let foodImage: UIImage
    let foodName: String
    let foodPrice: String
    
    init(foodImage: UIImage, foodName: String, foodPrice: String) {
        self.foodImage = foodImage
        self.foodName = foodName
        self.foodPrice = foodPrice
    }
}
