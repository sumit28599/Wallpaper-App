//
//  ApplicationUpdateManager.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import Foundation
import PromiseKit
private struct AppStoreLookUpResponse: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
private struct Result: Codable {
    let trackViewURL: String
    let bundleID, version: String

    enum CodingKeys: String, CodingKey {
        case trackViewURL = "trackViewUrl"
        case bundleID = "bundleId"
        case version
    }
}

public final class ApplicationUpdateManager {
    struct UpdateResponse {
        let isNewVersionAvailable: Bool
        let newVersionString: String
        let currentAppVersion: String
        let appstoreURL: String
    }
    enum Errors : Error {
        case unableToFetchCurrentAppVersion
        case unableToFetchBundleID
        case unableToGenerateLookUpURL
        case applicationNotFoundInAppStore
        case responseWasNotDecodedCorrectly
    }

    static let shared = ApplicationUpdateManager()
    private var task: URLSessionDataTask?
    private init() {}

    private func checkForUpdate(handler: @escaping ( (Swift.Result<UpdateResponse, ApplicationUpdateManager.Errors>) -> Void ) ) throws {

        guard let currentBundleVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { throw Errors.unableToFetchCurrentAppVersion }

        guard let bundleID = Bundle.main.bundleIdentifier else { throw Errors.unableToFetchBundleID }

        guard let lookupUrl = URL(string: "https://itunes.apple.com/th/lookup?bundleId=\(bundleID)") else { throw Errors.unableToGenerateLookUpURL }

        self.task?.cancel()

        self.task = URLSession.shared.dataTask(with: lookupUrl) { data, _, _ in
            guard let data = data else {
                handler(.failure(.applicationNotFoundInAppStore))
                return
            }
            do {
                let response = try JSONDecoder.init().decode(AppStoreLookUpResponse.self, from: data)

                guard let appStoreVersion = response.results.first(where: { result in
                    result.bundleID == bundleID
                }) else {
                    handler(.failure(.applicationNotFoundInAppStore))
                    return
                }
                handler(.success(UpdateResponse.init(
                    isNewVersionAvailable:appStoreVersion.version.compare(currentBundleVersion, options: .numeric) == .orderedDescending,
                    newVersionString: appStoreVersion.version,
                    currentAppVersion: currentBundleVersion,
                    appstoreURL: appStoreVersion.trackViewURL)))
            } catch {
                handler(.failure(.responseWasNotDecodedCorrectly))
            }
        }
        task?.resume()
    }
    public static func checkForUpdate() -> Promise<Bool> {
        return Promise { seal in
            try? ApplicationUpdateManager.shared.checkForUpdate { response in
                switch response {
                case .success(let data):
                    if data.isNewVersionAvailable {
                        seal.fulfill(true)
                    } else {
                        seal.fulfill(false)
                    }
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
