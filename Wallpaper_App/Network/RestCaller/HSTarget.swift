//
//  HSTarget.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
import Moya
public protocol HSTarget: TargetType {
    var cachePolicy: HSCachePolicy { get }
    var identifier: String { get }
}
extension HSTarget {
    var cachePolicy: HSCachePolicy {
        return .never
    }
    var identifier: String {
        assert(false, "Please define identifier in your moya target ")
        return ""
    }
    var headers: [String : String]? {
        return ["" : ""]
    }
}
