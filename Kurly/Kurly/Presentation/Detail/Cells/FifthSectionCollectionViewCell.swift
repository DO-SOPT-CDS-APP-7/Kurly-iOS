//
//  FifthSectionCollectionViewCell.swift
//  Kurly
//
//  Created by 김보연 on 11/23/23.
//

import UIKit

class FifthSectionCollectionViewCell: UICollectionViewCell, CollectionViewCellRegisterDequeueProtocol {
    
    static let identifier: String = "FifthSectionCollectionViewCell"
    
    private let noodleMaterialImageView = UIImageView()
    private let descriptionLabel = UILabel()
    private let nameTopLabel = UILabel()
    private let nameBottomLabel = UILabel()
    private let divider = UIView()
    private let noodleStoryLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .white
        
        noodleMaterialImageView.do {
            $0.image = ImageLiterals.Home.img.medium
        }
        
        descriptionLabel.do {
            $0.text = "베테랑의 대표메뉴를 집에서"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray5
        }
        
        nameTopLabel.do {
            $0.text = "[전주 베테랑]"
            $0.font = .fontGuide(.title_bold_25)
            $0.textColor = .gray5
        }
        
        nameBottomLabel.do {
            $0.text = "칼국수"
            $0.font = .fontGuide(.title_bold_25)
            $0.textColor = .gray5
        }
        
        divider.do {
            $0.backgroundColor = .gray4
        }
        
        noodleStoryLabel.do {
            $0.text = "전주로 가면 빼놓지 않고 들러야 하는 맛집 중 하나가 바로 베테랑인데요. 이곳의 인기 메뉴는 들개, 김, 고추가루를 툭 얹어낸 칼국수예요. 담백한 담음새와 달리, 요모조모 특별한 점이 많답니다. 사골, 멸치 육수를 사용하는 보통의 칼국수와 다르게 간장으로 맛을 내 깔끔하고 맑은 국물이 돋보이고요. 납작하지 않고 둥근 모양의 면발을 후루룩 넘기는 식간도 경쾌하지요. 면 반죽을 6회 이상 꾹꾹 눌러 만들었기에 씹히는 찰기와 탱글함도 남다르답니다. 따끈하게 조리한 칼국수에 따로 준비한 날계란을 술술 풀어주면, 매장에서 먹던 그 맛을 그대로 즐길 수 있을 거예요."
            $0.font = .fontGuide(.body_regular_14)
            $0.textColor = .gray5
            $0.numberOfLines = 0
            $0.lineBreakMode = .byCharWrapping
        }
    }
    
    private func setLayout() {
        self.addSubviews(noodleMaterialImageView, descriptionLabel, nameTopLabel, nameBottomLabel, divider, noodleStoryLabel)
        
        noodleMaterialImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(41)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(noodleMaterialImageView.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
        }
        
        nameTopLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        nameBottomLabel.snp.makeConstraints {
            $0.top.equalTo(nameTopLabel.snp.bottom).offset(0)
            $0.centerX.equalToSuperview()
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(nameBottomLabel.snp.bottom).offset(29)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        noodleStoryLabel.snp.makeConstraints {
            $0.top.equalTo(divider.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
