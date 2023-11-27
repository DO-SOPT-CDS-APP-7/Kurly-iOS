//
//  DetailViewController.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

final class DetailViewController: BaseViewController {
    
    private let navigationBar = CustomNavigationBar(type: .backCartButton)
    private let tabBarView = TabBarView()
    private let bottomBarView = DetailBottomBarView()
    private let notifyRemoveToastView = NotifyRemoveToastView()
    let upFloatingButton = FloatingButton(type: .up)
    let downFloatingButton = FloatingButton(type: .down)
    private let addCartViewController = AddCartViewController()
    private let afterAddCartViewController = AfterAddCartViewController()
    private let cartViewController = CartViewController()
    
    private let detailView = DetailView()
    
    private let dummy = DetailProduct.dummy()
    
    private var sections: [[DetailProduct]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindModel()
        setTarget()
    }
    
    override func loadView() {
        self.view = detailView
    }
    
    override func setUI() {
        view.backgroundColor = .white
    }
    
    override func setLayout() {
        view.addSubviews(navigationBar, tabBarView, bottomBarView, notifyRemoveToastView, upFloatingButton, downFloatingButton)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        tabBarView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(45)
        }
        
        bottomBarView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        notifyRemoveToastView.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottom)
            $0.height.equalTo(51)
            $0.leading.trailing.equalToSuperview().inset(8)
        }
        
        upFloatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(tabBarView.snp.bottom).offset(SizeLiterals.Screen.screenHeight * 482 / 812)
        }
        
        downFloatingButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(upFloatingButton.snp.bottom).offset(6)
        }
    }
    
    override func setDelegates() {
        detailView.detailCollectionView.delegate = self
        detailView.detailCollectionView.dataSource = self
    }
    
    override func setRegister() {
        FirstSectionCollectionViewCell.register(to: detailView.detailCollectionView)
        SecondSectionCollectionViewCell.register(to: detailView.detailCollectionView)
        ThridSectionHorizontalCollectionViewCell.register(to: detailView.detailCollectionView)
        FourthSectionCollectionViewCell.register(to: detailView.detailCollectionView)
        FifthSectionCollectionViewCell.register(to: detailView.detailCollectionView)
        SixthSectionCollectionViewCell.register(to: detailView.detailCollectionView)
        RecommendHeaderView.registerHeaderView(to: detailView.detailCollectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}

extension DetailViewController {
    
    @objc func tapDibsButton(_ sender: UIButton) {
        sender.isSelected.toggle()
        if !sender.isSelected {
            sender.setImage(ImageLiterals.Home.icn.heartButtonLine, for: .normal)
            viewToastView()
        } else {
            sender.setImage(ImageLiterals.Home.icn.heartButtonPressed, for: .normal)
            let relatedFoodModalViewController = RelatedFoodModalViewController()
            relatedFoodModalViewController.modalPresentationStyle = .automatic
            self.present(relatedFoodModalViewController, animated: true)
        }
    }
    
    @objc func tapFloatingButton(_ sender: FloatingButton) {
        let indexPath: IndexPath
        if sender.titleType == .up {
            indexPath = IndexPath(item: 0, section: 0)
        } else {
            let lastSection = detailView.detailCollectionView.numberOfSections - 1
            let lastItem = detailView.detailCollectionView.numberOfItems(inSection: lastSection) - 1
            indexPath = IndexPath(item: lastItem, section: lastSection)
        }
        detailView.detailCollectionView.scrollToItem(at: indexPath, at: .top, animated: true)
    }
    
    @objc private func presentaddCartViewController() {
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            return 361
        }
        
        if let sheet = addCartViewController.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        addCartViewController.delegate = self
        present(addCartViewController, animated: true, completion: nil)
    }
    
    @objc private func cartButtonTapped() {
        pushToCartViewController()
    }
}

extension DetailViewController {
    func viewToastView() {
        UIView.animate(withDuration: 0.5) {
            self.notifyRemoveToastView.upToastView()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 0.5) {
                self.notifyRemoveToastView.downToastView()
            }
        }
    }
}

extension DetailViewController {
    
    private func setTarget() {
        bottomBarView.bottomDibsButton.addTarget(self, action: #selector(tapDibsButton), for: .touchUpInside)
        upFloatingButton.addTarget(self, action: #selector(tapFloatingButton), for: .touchUpInside)
        downFloatingButton.addTarget(self, action: #selector(tapFloatingButton), for: .touchUpInside)
        bottomBarView.bottomCTAButton.addTarget(self, action: #selector(presentaddCartViewController), for: .touchUpInside)
        navigationBar.cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
    }
    
    private func bindModel() {
        sections = [[dummy]]
    }
    
    private func presentAfterAddCartViewController() {
        let detentIdentifier = UISheetPresentationController.Detent.Identifier("customDetent")
        let customDetent = UISheetPresentationController.Detent.custom(identifier: detentIdentifier) { _ in
            return 495
        }
        
        if let sheet = afterAddCartViewController.sheetPresentationController {
            sheet.detents = [customDetent]
            sheet.prefersGrabberVisible = true
        }
        present(afterAddCartViewController, animated: true, completion: nil)
    }
    
    func pushToCartViewController() {
        navigationController?.pushViewController(cartViewController, animated: true)
    }
}

extension DetailViewController: UICollectionViewDelegate {}

extension DetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections.count
            
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionViewCell.identifier, for: indexPath) as? FirstSectionCollectionViewCell else { return UICollectionViewCell() }
            item.bindModel(model: sections[indexPath.section][indexPath.item])
            return item
            
        case 1:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: SecondSectionCollectionViewCell.identifier, for: indexPath) as? SecondSectionCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        case 2:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ThridSectionHorizontalCollectionViewCell.identifier, for: indexPath) as? ThridSectionHorizontalCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        case 3:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FourthSectionCollectionViewCell.identifier, for: indexPath) as? FourthSectionCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        case 4:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: FifthSectionCollectionViewCell.identifier, for: indexPath) as? FifthSectionCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        case 5:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: SixthSectionCollectionViewCell.identifier, for: indexPath) as? SixthSectionCollectionViewCell else { return UICollectionViewCell() }
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 779 / 812)
            
        case 1:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 132 / 812)
            
        case 2:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 276 / 812)
            
        case 3:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 370 / 812)
            
        case 4:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 630 / 812)
            
        case 5:
            return CGSize(width: collectionView.frame.width, height: SizeLiterals.Screen.screenHeight * 514 / 812)
            
        default:
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 61)
            
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 2:
            if kind == UICollectionView.elementKindSectionHeader {
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecommendHeaderView.identifier, for: indexPath) as? RecommendHeaderView else { return UICollectionReusableView() }
                headerView.bindData(sectionText: "다른 고객이 함께 본 상품")
                return headerView
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension DetailViewController: DismissProtocol {
    
    func tapButton() {
        presentAfterAddCartViewController()
    }
}
