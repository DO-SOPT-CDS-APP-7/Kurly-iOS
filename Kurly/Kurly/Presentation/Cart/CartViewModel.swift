//
//  CartViewModel.swift
//  Kurly
//
//  Created by ParkJunHyuk on 12/15/23.
//

import Foundation

import Combine

class CartViewModel {
    
    @Published var cartItemData: [CartModel] = CartModel.dummy()
    @Published var selectedItem: [CartModel] = []

    private var cancellables = Set<AnyCancellable>()
    
    /// Cell 의 선택 버튼 상태와 인덱스(row)를 받아 처리
    func transformButtonState(input: AnyPublisher<(Bool, Int), Never>) {
        input
            .sink { [weak self] data in
                guard let self = self else { return }
                self.updateButtonState(state: data.0 , row: data.1)
            }
            .store(in: &cancellables)
    }
    
    /// 버튼 상태에 따른 작업 수행
    private func updateButtonState(state: Bool, row: Int) {
        if state == true {
            cartItemData[row].isSelect = state
            
            selectedItem.append(cartItemData[row])
        } else {
            cartItemData[row].isSelect = state
            
            if let index = selectedItem.firstIndex(where: { $0.productName == cartItemData[row].productName }) {
                selectedItem.remove(at: index)
            }
        }
    }
    
    /// 버튼 상태와 인덱스(row)를 받아 모든 요소를 selectedItem 에 추가 및 삭제 ( 전체 선택 버튼 )
    func transformSelectButton(input: AnyPublisher<Bool, Never>) {
        input
            .sink { [weak self] data in
                guard let self = self else { return }
               
                if data == true {
                    for i in 0..<cartItemData.count {
                        if cartItemData[i].isSelect == false {
                            cartItemData[i].isSelect = true
                            selectedItem.append(cartItemData[i])
                        }
                    }
                } else {
                    for i in 0..<cartItemData.count {
                        cartItemData[i].isSelect = false
                        selectedItem.removeAll()
                    }
                }
            }
            .store(in: &cancellables)
    }
}
