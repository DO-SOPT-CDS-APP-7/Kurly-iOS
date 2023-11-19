//
//  UICollectionView+.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/19/23.
//

import UIKit

extension UICollectionView {
    func fetchCellRectFor(indexPath index: IndexPath, paddingFromLeading: CGFloat, cellHorizontalPadding: CGFloat) -> TabBarRect {
        guard let cellAttributes = self.layoutAttributesForItem(at: index) else { return TabBarRect(index: 0, width: 0, xPosition: CGPoint()) }
        let cellOrigin = cellAttributes.frame.origin
        let cellXPosition: CGPoint = CGPoint(x: cellOrigin.x - 2 + paddingFromLeading, y: cellOrigin.y)
        
        let cellWidth: CGFloat = cellAttributes.size.width - cellHorizontalPadding
        
        return TabBarRect(index: index.item, width: cellWidth + 4, xPosition: cellXPosition)
    }
}
