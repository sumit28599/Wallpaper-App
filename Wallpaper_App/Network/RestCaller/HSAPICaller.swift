//
//  HSAPICaller.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
public struct HSAPICaller {
    public static func forceRemoveAllCache() {
        Sweeper.forceDeleteCache()
    }
    public static var debug = false
}
