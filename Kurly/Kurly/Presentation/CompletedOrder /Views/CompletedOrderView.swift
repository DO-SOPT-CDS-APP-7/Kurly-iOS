//
//  CompletedOrderView.swift
//  Kurly
//
//  Created by ParkJunHyuk on 2023/11/24.
//

import UIKit

import SnapKit
import Then

class CompletedOrderView: BaseView {
    
    private let completedImageView = UIImageView()
    private let completedTitelLabel = UILabel()
    let orderDetailCTAButton = BottomCTAButton(type: .orderDetail)
    let shoppingCTAButton = BottomCTAButton(type: .shopping)

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setUI() {
        self.backgroundColor = .white
        
        completedImageView.do {
            $0.image = ImageLiterals.Home.icn.checkButton
        }
        
        completedTitelLabel.do {
            $0.text = "마켓컬리님의 주문이 완료되었습니다.\n내일 아침에 만나요!"
            $0.font = .fontGuide(.title_semibold_20)
            $0.textColor = .gray7
            $0.numberOfLines = 2
            $0.lineBreakMode = .byCharWrapping
            $0.textAlignment = .center
        }
    }
    
    override func setLayout() {
        self.addSubviews(completedImageView, completedTitelLabel, orderDetailCTAButton, shoppingCTAButton)
        
        completedImageView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(48)
            $0.horizontalEdges.equalToSuperview().inset(153)
        }
        
        completedTitelLabel.snp.makeConstraints{
            $0.top.equalTo(completedImageView.snp.bottom).offset(12)
            $0.horizontalEdges.equalToSuperview().inset(41)
        }
        
        orderDetailCTAButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(shoppingCTAButton.snp.top).inset(-14)
        }
        
        shoppingCTAButton.snp.makeConstraints{
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(10)
        }
    }
}
