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
    private let relatedFoodService = RelatedFoodService(apiService: APIService().self)
    
    override func loadView() {
        self.view = relatedFoodModalView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSheetPresentation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getRelatedFood()
        viewToastView()
    }
    
    private func setSheetPresentation() {
        if let sheetPresentationController = sheetPresentationController {
            sheetPresentationController.detents = [.medium(), .large()]
        }
    }
}

extension RelatedFoodModalViewController {
    
    private func getRelatedFood() {
        Task {
            do {
                let result = try await relatedFoodService.fetchProduct()
                relatedFoodModalView.collectionView.updateModel(with: result, newModel2: result)
            }
            catch {
                guard let error = error as? NetworkError else { return }
                print(error.description)
            }
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
