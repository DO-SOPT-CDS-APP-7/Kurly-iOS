//
//  NSObject+.swift
//  Kurly
//
//  Created by 김보연 on 11/18/23.
//

import Foundation

extension NSObject {

    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
