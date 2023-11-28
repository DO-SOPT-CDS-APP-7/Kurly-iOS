//
//  Config.swift
//  Kurly
//
//  Created by Minjoo Kim on 11/28/23.
//

import Foundation

enum Config {

    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found !!!")
        }
        return dict
    }()
}


extension Config {

    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("BASE_URL is not set in plist for this configuration")
        }
        return key
    }()
}
