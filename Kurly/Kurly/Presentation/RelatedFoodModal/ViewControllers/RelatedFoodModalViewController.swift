//
//  RelatedFoodModalViewController.swift
//  Kurly
//
//  Created by 강민수 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class RelatedFoodModalViewController: BaseViewController {
    
    private let relatedFoodModalView = RelatedFoodModalView()
    private var relatedFoodList: [RecommendModel] = [
        .init(foodImage: ImageLiterals.Home.img.activityTop01, foodName: "[시골보쌈과 감자옹심이 감자...", foodPrice: "10,500원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop02, foodName: "[이연복의 목란] 짬뽕 2인분...", foodPrice: "13,800원"),
        .init(foodImage: ImageLiterals.Home.img.activityTop03, foodName: "[방방곡곡] 비빔국수 키트(2인...", foodPrice: "9,900원")
    ]

    private var recommendFoodList: [RecommendModel] = [
        .init(foodImage: ImageLiterals.Home.img.activityBottom01, foodName: "[시골보쌈과 감자옹심이 감자...", foodPrice: "10,500원"),
        .init(foodImage: ImageLiterals.Home.img.activityBottom02, foodName: "[이연복의 목란] 짬뽕 2인분...", foodPrice: "13,800원"),
        .init(foodImage: ImageLiterals.Home.img.activityBottom03, foodName: "[방방곡곡] 비빔국수 키트(2인...", foodPrice: "9,900원")
    ]
    
    override func loadView() {
        self.view = relatedFoodModalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSheetPresentation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewToastView()
    }
    
    private func setSheetPresentation() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
    }
}

extension RelatedFoodModalViewController {
    
    func viewToastView() {
        UIView.animate(withDuration: 0.5) {
            self.relatedFoodModalView.notifyAddToastView.upToastView()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5) {
                self.relatedFoodModalView.notifyAddToastView.downToastView()
            }
        }
    }
}
