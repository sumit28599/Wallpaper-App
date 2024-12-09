//
//  GalleryDataModel.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation


struct PhotoResponse: Codable {
    let results: [Photo]
}

struct Photo: Codable {
    let id: String
    let altDescription: String?
    let slug: String
    let urls: PhotoUrls
    let likes: Int
}

struct PhotoUrls: Codable {
    let regular: String
    let small: String
}

