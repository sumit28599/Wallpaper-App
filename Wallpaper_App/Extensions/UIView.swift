//
//  UIView.swift
//  Digi Lawyer
//
//  Created by Mohd Haris on 14/11/24.
//

import UIKit

extension UIView{
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
      }
      
      public func addSubviewsList(_ views: [UIView]) {
        views.forEach { addSubview($0) }
      }
}
