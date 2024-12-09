//
//  EnvironmentSetup.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation
public enum EnvironmentCon : String {
    case debugDev = "Debug"
    case releaseDev = "Release"

    case debugStage = "DebugStage"
    case releaseStage = "ReleaseStage"

    case debugProd = "DebugProd"
    case releaseProd = "ReleaseProd"
}
public class BuildConfiguration { // 2
    public static let shared = BuildConfiguration()
    public var environment: EnvironmentCon
    private init() {
        let currentConfiguration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as! String
        environment = EnvironmentCon(rawValue: currentConfiguration)!
    }
    public static var getConfigFileName : String {
        let env = BuildConfiguration.shared.environment
        switch env {
        case .debugStage, .releaseStage:
            return "EnvironmentStage"
        case .debugProd, .releaseProd:
            return "EnvironmentProd"
        case .debugDev, .releaseDev:
            return "EnvironmentDev"
        }
    }
}
