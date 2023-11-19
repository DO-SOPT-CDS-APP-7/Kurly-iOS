//
//  TabBarCollectionViewCell.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

import SnapKit
import Then

final class TabBarCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                tapMenuLabel.font = .fontGuide(.body_medium_15)
                tapMenuLabel.textColor = .kuPurple
            } else {
                tapMenuLabel.font = .fontGuide(.body_regular_15)
                tapMenuLabel.textColor = .gray5
            }
        }
    }
    
    private let tapMenuLabel = UILabel()
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        basicSetup()
        setStyle()
        setLayout()
    }
    
    private func basicSetup() {
        self.backgroundColor = .clear
    }
    
    private func setStyle() {
        tapMenuLabel.do {
            $0.textColor = .gray5
            $0.font = .fontGuide(.body_regular_15)
            $0.textAlignment = .center
            $0.adjustsFontSizeToFitWidth = true
        }
        
        stackView.do {
            $0.axis = .horizontal
            $0.distribution = .equalSpacing
            $0.spacing = 4
            $0.alignment = .center
        }
    }
    
    private func setLayout() {
        stackView.addArrangedSubview(tapMenuLabel)
        self.addSubviews(stackView)
        
        stackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TabBarCollectionViewCell {
    
    func configureCell(tapMenu: String) {
        self.tapMenuLabel.text = tapMenu
    }
    
    func configureCellWithImage(tapMenu : String) {
        self.tapMenuLabel.text = tapMenu
    }
}
