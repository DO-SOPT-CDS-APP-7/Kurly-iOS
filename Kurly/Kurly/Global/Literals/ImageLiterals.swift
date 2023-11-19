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
        
        enum icn {
            static var backButton: UIImage { .load(name: "ic_back") }
            static var cartButton22: UIImage { .load(name: "ic_cart_button22") }
            static var cartButton: UIImage { .load(name: "ic_cart") }
            static var checkButtonDefault: UIImage { .load(name: "ic_check_default") }
            static var checkButtonPressed: UIImage { .load(name: "ic_check_pressed") }
            static var checkButton: UIImage { .load(name: "ic_check") }
            static var closeButtonGray: UIImage { .load(name: "ic_close_gray") }
            static var closeButton: UIImage { .load(name: "ic_close") }
            static var downFloatingButton: UIImage { .load(name: "ic_down_floating") }
            static var filterButton: UIImage { .load(name: "ic_filter") }
            static var heartButtonLine: UIImage { .load(name: "ic_heart_line") }
            static var heartButtonPressed: UIImage { .load(name: "ic_heart_pressed") }
            static var helpButton: UIImage { .load(name: "ic_help") }
            static var locationButtonGray: UIImage { .load(name: "ic_location_gray") }
            static var locationButton: UIImage { .load(name: "ic_location") }
            static var minusButton: UIImage { .load(name: "ic_minus") }
            static var plusButton: UIImage { .load(name: "ic_plus") }
            static var recommendationRoundButton22: UIImage { .load(name: "ic_recommendation_round_box22") }
            static var recommendationButton: UIImage { .load(name: "ic_recommendation") }
            static var refrigerationButton: UIImage { .load(name: "ic_refrigeration") }
            static var reviewButton: UIImage { .load(name: "ic_review") }
            static var roundCloseButton: UIImage { .load(name: "ic_round_close") }
            static var searchButtonGray: UIImage { .load(name: "ic_search_gray") }
            static var shareButton: UIImage { .load(name: "ic_share") }
            static var shorycutButtonBlack: UIImage { .load(name: "ic_shortcut_black") }
            static var shorycutButtonWhite: UIImage { .load(name: "ic_round ic_shortcut_white") }
            static var topFloatingButton: UIImage { .load(name: "ic_top_floating") }
            static var KuBrand: UIImage { .load(name: "KuBrand") }
            static var KuGood: UIImage { .load(name: "KuGood") }
            static var KuProcess: UIImage { .load(name: "KuProcess") }
        }
    }
    
    enum navigation {
        static var backButton: UIImage { .load(name: "ic_back") }
        static var closeButton: UIImage { .load(name: "ic_close") }
        static var cartButton: UIImage { .load(name: "ic_cart") }
    }
}
