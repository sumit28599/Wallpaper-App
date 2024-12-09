//
//  ImagesAPIManager.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import PromiseKit


private let imagesQueue = OperationQueue()

class ImagesAPIManager: NSObject {
    
    func fetchImages() -> Promise<PhotoResponse> {
        return Promise { seal in
            let provider = HSAPICall<ImagesAPI, PhotoResponse>.initialize(target: .fetchImagesList)
            
            provider.caller.decodedResultCallback = { result in
                switch result {
                case .success(let response):
                    seal.fulfill(response)
                case .failure(let error):
                    seal.reject(error)
                }
            }
            imagesQueue.addOperation(provider.caller)
        }
    }
}
