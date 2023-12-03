//
//  DateFormatterExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 05/02/22.
//

import Foundation

extension DateFormatter {
  public convenience init(format: String, timeZone: TimeZone = .current, locale: String? = nil) {
    self.init()
    dateFormat = format
    self.timeZone = timeZone
    if let locale = locale {
      self.locale = Locale(identifier: locale)
    }
  }
}
