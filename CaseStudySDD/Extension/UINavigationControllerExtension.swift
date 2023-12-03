//
//  UINavigationControllerExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 24/01/22.
//

import UIKit

extension UINavigationController {
  func popViewController(animated: Bool = true, completion: @escaping (() -> Void)) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    self.popViewController(animated: animated)
    CATransaction.commit()
  }
}
