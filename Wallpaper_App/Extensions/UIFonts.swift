//
//  UIFonts.swift
//  Digi Lawyer
//
//  Created by Mohd Haris on 14/11/24.
//

import UIKit
 
enum SizeFamily: String {
    case light = "Light"
    case regular = "Regular"
    case bold = "Bold"
    case black = "Black"
    case semibold = "SemiBold"
}
enum AppFontFamily: String {
    case poppins = "poppins"
}
extension UIFont {
    static func font(family: AppFontFamily, sizeFamily: SizeFamily, size: CGFloat) -> UIFont {
        return UIFont(name: "\(family.rawValue)-\(sizeFamily.rawValue)", size: size)!
    }
}
