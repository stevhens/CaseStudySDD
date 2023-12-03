//
//  UINavigationBarExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

extension UINavigationBar {
  func showBottomHairline(_ flag: Bool) {
    hairlineImageView?.isHidden = !flag
  }
}
