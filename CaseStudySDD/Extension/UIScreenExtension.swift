//
//  UIScreenExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 13/12/21.
//

import UIKit

extension UIScreen {
  static func getWidth() -> CGFloat {
    return UIScreen.main.bounds.size.width
  }

  static func getHeight() -> CGFloat {
    return UIScreen.main.bounds.size.height
  }
}
