
//  String.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation
extension String {
    var localised: String {
        return NSLocalizedString(self, comment: self)
    }
}
