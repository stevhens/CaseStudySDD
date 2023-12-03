//
//  UIViewExtension.swift
//  CaseStudySDD
//
//  Created by Stevhen on 02/12/23.
//

import UIKit

extension UIView {
    var hairlineImageView: UIImageView? {
        return hairlineImageView(in: self)
    }
    
    func hairlineImageView(in view: UIView) -> UIImageView? {
        if let imageView = view as? UIImageView, imageView.bounds.height <= 1.0 {
            return imageView
        }
        
        for subview in view.subviews {
            if let imageView = self.hairlineImageView(in: subview) { return imageView }
        }
        
        return nil
    }
}
