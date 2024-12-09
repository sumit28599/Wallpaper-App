//
//  GalleryViewModel.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//


import PromiseKit
 
class GalleryViewModel{
    private let userAPICaller = ImagesAPIManager()
    
    var error: Observable<Error?> = Observable(nil)
    var imageResponse: Observable<PhotoResponse?> = Observable(nil)
    
    func getImageData() {
        firstly {
            userAPICaller.fetchImages()
        }.done { [weak self] response in
            print("Image fetch successful")
            self?.imageResponse.value = response
        }.catch { [weak self] error in
            print("Image fetch failed: \(error)")
            self?.error.value = error
        }
    }
    
    func stringSeprater(stringValue: String) -> String {
        let subString = stringValue.components(separatedBy: "-")
        let name = subString[0]
        return name
    }
}
