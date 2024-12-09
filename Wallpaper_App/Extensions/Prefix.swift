//
//  Prefix.swift
//  Digi Lawyer
//
//  Created by Mohd Haris on 14/11/24.
//

import UIKit

prefix operator ~
prefix public func ~ (string: Substring?) -> String {
    return String(string ?? "")
}

prefix public func ~ (string: Int64?) -> Int64 {
    return string ?? Int64(0)
}

prefix public func ~ (string: String?) -> String {
    return string ?? ""
}

prefix public func ~ (string: Int?) -> Int {
    return string ?? 0
}

prefix public func ~ (string: Bool?) -> Bool {
    return string ?? false
}

prefix public func ~ (string: Double?) -> Double {
    return string ?? 0.0
}

prefix public func ~ (string: Float?) -> Float {
    return string ?? 0.0
}

prefix func ~ (string: CGFloat?) -> CGFloat {
    return string ?? 0.0
}

prefix func ~ (string: URL?) -> URL {
    return string ?? URL(fileURLWithPath: "")
}

