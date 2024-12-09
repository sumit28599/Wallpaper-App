//
//  ImagesAPICaller.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Moya

enum ImagesAPI {
    case fetchImagesList
}
extension ImagesAPI : HSTarget {
    
    var sampleData: Data {
        return Data()
    }
    var cachePolicy: HSCachePolicy {
        return .never
    }
    var identifier: String {
        return ""
    }
    var baseURL: URL {
        return URL(fileURLWithPath: "https://api.unsplash.com")
    }
    
    var path: String {
        switch self {
        case .fetchImagesList:
            return "/search/photos"
        }
    }
    var method: Moya.Method {
        switch self {
        case .fetchImagesList:
            return .get
        }
    }
    var task: Moya.Task {
        switch self {
        case .fetchImagesList:
            let params: [String : Any] = [
                "client_id": "5x-GgegTi_Gi-iraB-k88xkYhesvnH4KIQm6IdRdK-8",
                "query" : "wallpaper",
                "per_page": 100
            ]
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    var headers: [String : String]? {
        switch self {
            
        default:
            return [:]
        }
    }
}

