//
//  Array.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
