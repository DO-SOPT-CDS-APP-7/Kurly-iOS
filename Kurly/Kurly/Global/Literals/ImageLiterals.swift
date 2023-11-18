//
//  ImageLiterals.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import UIKit

enum ImageLiterals {
    enum Home {
        enum img {
            static var activityBottom01: UIImage { .load(name: "img_activity_view_01_bottom") }
            static var activityTop01: UIImage { .load(name: "img_activity_view_01_top") }
            static var activityBottom02: UIImage { .load(name: "img_activity_view_02_bottom") }
            static var activityTop02: UIImage { .load(name: "img_activity_view_02_top") }
            static var activityBottom03: UIImage { .load(name: "img_activity_view_03_bottom") }
            static var activityTop03: UIImage { .load(name: "img_activity_view_03_top") }
            
            static var large: UIImage { .load(name: "img_Large") }
            static var material: UIImage { .load(name: "img_material") }
            static var medium: UIImage { .load(name: "img_medium") }
            static var smallCart: UIImage { .load(name: "img_small_cart") }
            static var small: UIImage { .load(name: "img_small") }
            
            static var thumbnail01: UIImage { .load(name: "img_thumbnail_01_small_slide") }
            static var thumbnail02: UIImage { .load(name: "img_thumbnail_02_small_slide") }
            static var thumbnail_03: UIImage { .load(name: "img_thumbnail_03_small_slide") }
            static var thumbnailLarge: UIImage { .load(name: "img_thumbnail_Large") }
        }
    }
}
