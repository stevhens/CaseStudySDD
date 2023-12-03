//
//  NSObjectExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 13/12/21.
//

import Foundation

extension NSObject {
  var className: String {
    return String(describing: type(of: self))
  }

  class var className: String {
    return String(describing: self)
  }
}
