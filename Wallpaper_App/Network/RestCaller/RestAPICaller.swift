//
//  RestAPICaller.swift
//  Wallpaper
//
//  Created by Mohd Haris on 11/11/24.
//

import Foundation
import Moya
import UIKit
public enum NetworkError : String,Error {
    case noInternet
    case somethingWentWrong
    case internalServerError
}
public class HSAPICall<Target: HSTarget, RESPONSE>: AsyncOperation , Cancellable where RESPONSE : Codable {
    public var decodedResultCallback: ((Result<RESPONSE, Error>) -> Void )?
    private var retryCount = 0
    public var moyaResponseCallback: ((Result<Moya.Response, Moya.MoyaError>) -> Void )?
    private(set) var results:Result<RESPONSE, Error>? {
        didSet {
            guard let result = results else { return }
            switch result {
            case .success(let response):
                if let responseData = try? JSONEncoder().encode(response), let responseString = String(data: responseData, encoding: .utf8) {
                    self.cache(str: responseString)
                }
                self.decodedResultCallback?(result)
            case .failure(let error):
                if let statuscode = (error as? MoyaError)?.response?.statusCode, (statuscode == HTTPStatusCode.unauthorized.rawValue && self.retryCount < 2) {
                    self.main()
                } else {
                    self.decodedResultCallback?(result)
                    self.finish()
                }
            }
        }
    }
    private let moyaprovider: MoyaProvider<Target>
    internal var apitarget: Target?
    private var apiTask: Cancellable?
    private var isFirstTimeRefershTokenCall = true
    public override func cancel() {
        self.results = .failure(APICallCancelledError())
        self.apiTask?.cancel()
        super.cancel()
    }
    public static func initialize(target: Target) -> (caller: HSAPICall<Target, RESPONSE>, cachedValue: RESPONSE?) {
        let restCallerObject = HSAPICall<Target, RESPONSE>.init(target: target)
        if let cachedObject = try? Cacher.getCachedObject(for: target),let cached = toCodeable(str: cachedObject) {
            debugPrint("Load data from cache")
            return (restCallerObject, cached)
        }
        return (restCallerObject, nil)
    }
    init(target: Target?) {
        self.apitarget = target
        self.moyaprovider = MoyaProvider<Target>()
        super.init()
    }
    
    @discardableResult public func runOnMainQueue() -> HSAPICall {
        OperationQueue.main.addOperation(self)
        return self
    }
    private class func toCodeable(str: String) -> RESPONSE? {
        guard let data = str.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(RESPONSE.self, from: data)
    }
    private func cache(str: String ) {
        guard let target = apitarget else {
            return
        }
        guard case .never = target.cachePolicy else {
            Cacher.cacheResponse(for: target, response: str)
            return
        }
    }
    private func checkForCacheObject() -> Bool {
        guard let target = apitarget else {
            return false
        }
        if let cachedObject = try? Cacher.getCachedObject(for: target),let cached = HSAPICall<Target, RESPONSE>.toCodeable(str: cachedObject) {
            debugPrint("Load data from cache")
            self.results = .success(cached)
            return true
        }
        return false
    }
    public override func main() {
        if isCancelled {
            return
        }
        retryCount = retryCount + 1
        self.callAPI()
    }
    private func callAPI() {
        guard let apitarget = self.apitarget else { return }
        guard !(checkForCacheObject()) else { return }
        if !Reachability.isConnectedToNetwork() {
            self.results = .failure(NetworkError.noInternet)
            return
        }
        apiTask = moyaprovider.request(apitarget, completion: { [weak self] response in
            self?.moyaResponseCallback?(response)
            switch response {
            case .success(let responseData):
                let httpResponseType = HTTPStatusCode(rawValue: responseData.statusCode)?.responseType
                if httpResponseType == .serverError {
                    self?.handleInternalServerError(error: NetworkError.internalServerError)
                } else {
                    self?.handleSuccessResponse(responseData: responseData)
                }
            case .failure(let moyaerror):
                self?.handleFailureResponse(moyaerror: moyaerror)
            }
        })
    }
    private func handleInternalServerError(error : Error) {
        self.results = .failure(error)
    }
    private func handleFailureResponse(moyaerror: MoyaError) {
        if moyaerror.response?.statusCode == HTTPStatusCode.unauthorized.rawValue && ~self.isFirstTimeRefershTokenCall {
            self.callRefreshTokenApi()
        } else {
            self.results = .failure(moyaerror)
        }
    }
    private func handleSuccessResponse(responseData : Response) {
        do {
            let str = try responseData.mapString()
            debugPrint(str)
            debugPrint(str)
            let error = try JSONDecoder().decode(ErrorResponse.self, from: responseData.data)
            if ~error.errorCode == "\(AppErrorCodes.sessionExpired.rawValue)" && ~self.isFirstTimeRefershTokenCall {
                self.callRefreshTokenApi()
            } else {
                self.results = .failure(error)
            }
        } catch {
            do {
                if RESPONSE.self is String.Type {
                    let str = try responseData.mapString()
                    debugPrint(str)
                    self.results = .success(str as! RESPONSE)
                    return
                }
                let codableData = try JSONDecoder().decode(RESPONSE.self, from: responseData.data)
                debugPrint("Load data from server")
                self.results = .success(codableData)
            } catch let jsonParsingError {
                debugPrint(jsonParsingError.localizedDescription)
                self.results = .failure(jsonParsingError)
            }
        }
    }
    private func callRefreshTokenApi() {
        self.isFirstTimeRefershTokenCall = false
//        let request = RefreshTokenRequest(token: "\(UserManager.tokenType) \(UserManager.refreshToken)")
//        let moyaProvider = MoyaProvider<LoginAPI>()
//        moyaProvider.request(LoginAPI.refreshToken(request: request)) { [weak self] result in
//            switch result {
//            case .success(let responseData):
//                UserManager.userToken = ~responseData.response?.value(forHTTPHeaderField: APIConstants.accessTokenHeader)
//                UserManager.refreshToken = ~responseData.response?.value(forHTTPHeaderField: APIConstants.refreshTokenHeader)
//                UserManager.tokenType = ~responseData.response?.value(forHTTPHeaderField: APIConstants.tokenTypeHeader)
//                self?.callAPI()
//                debugPrint("Refresh token api called")
//            case .failure:
//                self?.callAPI()
//            }
//        }
    }
}
extension Optional {
    public func orThrow(
        _ errorExpression: @autoclosure () -> Error
    ) throws -> Wrapped {
        guard let value = self else {
            throw errorExpression()
        }
        return value
    }
}

public struct ErrorResponse: Codable, Error {
    public var statusCode : Int
    public var message : String?
    public var errorCode : String
    public var debugId: String?
    public var timeStamp: String?
}

public enum AppErrorCodes : String {
    case sessionExpired = "GC_INVALID_TOKEN_ERROR"
}
