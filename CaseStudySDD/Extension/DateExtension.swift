//
//  DateExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 17/12/21.
//

import Foundation

extension Date {
  func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZ") -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "id_ID")
    formatter.dateFormat = format
    return formatter.string(from: self)
  }
}
