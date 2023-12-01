//
//  BottomCTAButton.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/20/23.
//

import UIKit

import Then

enum BottomCTAButtonType {
    
    case buy
    case more
    case addCart
    case order
    case orderDetail
    case shopping
    case emptyCart
    
    var title: String {
        switch self {
        case .buy:
            return "구매하기"
        case .more:
            return "연관상품 더보기"
        case .addCart:
            return "원 장바구니 담기"
        case .order:
            return "원 주문하기"
        case .orderDetail:
            return "주문 상세보기"
        case .shopping:
            return "쇼핑 계속하기"
        case .emptyCart:
            return "상품을 담아주세요"
        }
    }
}

final class BottomCTAButton: UIButton {
    
    var titleType: BottomCTAButtonType {
        didSet{
            setUI()
            print("버튼 값 변경")
        }
    }
    
    init(type: BottomCTAButtonType) {
        self.titleType = type
        super.init(frame: .zero)
        setUI()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BottomCTAButton {
    
    private func setUI() {
        self.do {
            $0.frame(forAlignmentRect: CGRect(origin: .zero, size: CGSize(width: SizeLiterals.Screen.screenWidth - 32,
                                                                          height: SizeLiterals.Screen.screenHeight * 50 / 812)))
            $0.setTitle(titleType.title, for: .normal)
            $0.titleLabel?.font = .fontGuide(.title_semibold_16)
            $0.layer.cornerRadius = 6
            switch titleType {
            case .orderDetail:
                $0.backgroundColor = .white
                $0.setTitleColor(.gray6, for: .normal)
                $0.makeBorder(width: 1, color: .gray3)
            case .emptyCart:
                $0.backgroundColor = .gray3
                $0.setTitleColor(.white, for: .normal)
            default:
                $0.backgroundColor = .kuPurple
                $0.setTitleColor(.white, for: .normal)
            }
        }
    }
    
    private func setLayout() {
        self.snp.makeConstraints {
            if(titleType == .buy) {
                $0.width.equalTo(SizeLiterals.Screen.screenWidth - 87)
            }
            else {
                $0.width.equalTo(SizeLiterals.Screen.screenWidth - 32)
            }
            $0.height.equalTo(SizeLiterals.Screen.screenHeight * 50 / 812)
        }
    }
}
