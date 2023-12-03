//
//  Configuration.swift
//  CaseStudySDD
//
//  Created by Stevhen on 03/12/23.
//

import Foundation

enum ConfigKey: String {
    case fcmApiKey
}

enum Configuration {
    private static var infoDict: [String: Any] {
        guard let dict = Bundle.main.infoDictionary else { fatalError("Plist file not found") }
        return dict
    }
    
    static func value(_ key: ConfigKey) -> String {
        return Configuration.infoDict[key.rawValue] as? String ?? ""
    }
}

