//
//  FormatterExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 05/02/22.
//

import Foundation

extension Formatter {
  static let withSeparator: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.groupingSeparator = "."
    formatter.numberStyle = .decimal
    return formatter
  }()
}
