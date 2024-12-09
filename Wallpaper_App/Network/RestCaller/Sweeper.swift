//
//  Sweeper.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
public class Sweeper: NSObject {
    public static func forceDeleteCache () {
        let cacheDir = cacheDirectory()
        do {
            let filesURL =  try FileManager.default.contentsOfDirectory(atPath: cacheDir)
            for file in filesURL {
                deletecache(identifier: file)
            }
        } catch {
            debugPrint("Error while enumerating files \(cacheDir): \(error.localizedDescription)")
        }
    }
    
    public static func sweepCache() {
        let cacheDir = cacheDirectory()
        do {
            let filesURL =  try FileManager.default.contentsOfDirectory(atPath: cacheDir)
            for file in filesURL {
                let filestring = read(for: file)
                if let data = filestring?.data(using: .utf8), let cachedObject = try? JSONDecoder().decode(CacheObject.self, from: data),  cachedObject.expiryDate.timeIntervalSinceNow <= 0 {
                    deletecache(identifier: file)
                }
            }
        } catch {
            debugPrint("Error while enumerating files \(cacheDir): \(error.localizedDescription)")
        }
    }
}
