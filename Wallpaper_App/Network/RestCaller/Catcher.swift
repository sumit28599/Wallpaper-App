//
//  Catcher.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
import Moya
struct CacheObject: Codable {
    let responseString: String
    let expiryDate: Date
}
func cacheDirectory() -> String {
    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory,
                                                                .userDomainMask,
                                                                true)
    let docURL = URL(string: documentDirectory[0])!
    let dataPath = docURL.appendingPathComponent("HSAPICaller")
    if !FileManager.default.fileExists(atPath: dataPath.absoluteString) {
        do {
            try FileManager.default.createDirectory(atPath: dataPath.absoluteString, withIntermediateDirectories: true, attributes: nil)
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
    return dataPath.absoluteString
}
func deletecache(identifier: String) {
    guard let urlString = append(toPath: cacheDirectory(), withPathComponent: identifier) else { return }
    let url = URL(fileURLWithPath: urlString)
    debugPrint("Deleting file \(url)")
    try? FileManager.default.removeItem(at: url)
}

private func append(toPath path: String,
                    withPathComponent pathComponent: String) -> String? {
    if var pathURL = URL(string: path) {
        pathURL.appendPathComponent(pathComponent)
        
        return pathURL.absoluteString
    }
    return nil
}
func read(for identifier: String) -> String? {
    guard let filePath = append(toPath: cacheDirectory(),
                                     withPathComponent: identifier) else {
        return nil
    }
    do {
        let savedString = try String(contentsOfFile: filePath)
        return savedString
    } catch let erorr {
        debugPrint("Error reading saved file \(erorr)")
        return nil
    }
}
private func save(text: String,
                  identifier: String) {
    guard let filePath = append(toPath: cacheDirectory(),
                                     withPathComponent: identifier) else {
        return
    }
    
    do {
        try text.write(toFile: filePath,
                       atomically: true,
                       encoding: .utf8)
    } catch {
        debugPrint("Error \(error)")
        return
    }
    
    debugPrint("Save successful")
}

struct Cacher {

    static func getCachedObject(for target: HSTarget) throws -> String? {
        
        switch target.cachePolicy {
        case .never, .refreshCache:
            return nil
            
        case .firstFromCache:
            
            guard let responseString = read(for: target.identifier) else { return nil }
            guard let data = responseString.data(using: .utf8) else { return nil }
            
            do {
                let cached = try JSONDecoder().decode(CacheObject.self, from:  data)
                if cached.expiryDate.timeIntervalSinceNow <= 0 {
                    deletecache(identifier: target.identifier)
                    return nil
                }
                return cached.responseString
            } catch let error {
                debugPrint("JSON Decoding Error \(error)")
                throw error
            }
        }
    }

    static func cacheResponse(for target: HSTarget, response: String) {
        let expiryDate: Date
        switch target.cachePolicy {
        case .never:
            return
        case .refreshCache(timeLimit: let timeLimit),
             .firstFromCache(timeLimit: let timeLimit):
            expiryDate = Date().addingTimeInterval(timeLimit)
        }
        let cacheObject = CacheObject(responseString: response, expiryDate: expiryDate)
        guard let cachedObjectData = try? JSONEncoder().encode(cacheObject) else { return }
        guard let cachedObjectString = String(data: cachedObjectData, encoding: .utf8) else { return }
        save(text: cachedObjectString, identifier: target.identifier)
    }
}
public enum HSCachePolicy {
    case never // goes directly to the server
    case refreshCache(timeLimit: TimeInterval) // goes directly to serve and caches the response
    case firstFromCache(timeLimit: TimeInterval) // goes to cache if found returns form cache
}
public struct APICallCancelledError: Error { }
public struct CacherError: Error {
    let description: String
}
