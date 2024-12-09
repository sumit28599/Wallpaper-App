//
//  TabBarVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 05/12/24.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Create instances of the view controllers
        let galleryVC = GalleryVC()
        let profileLoginVC = ProfileLoginVC()
        let profileLogoutVC = ProfileVC()
        let searchVC = SearchVC()
        
        let targetSize = CGSize(width: 30, height: 30)

        let resizedHomeImage = resizedImage(image: UIImage(named: "home_image")!, targetSize: targetSize)
        let resizedHeartImage = resizedImage(image: UIImage(named: "heartshape")!, targetSize: targetSize)
        let resizedSearchImage = resizedImage(image: UIImage(named: "search")!, targetSize: targetSize)
        let resizedProfileImage = resizedImage(image: UIImage(named: "profile")!, targetSize: targetSize)

        let firstTabItem = UITabBarItem(title: "", image: resizedHomeImage, tag: 0)
        let secondTabItem = UITabBarItem(title: "", image: resizedHeartImage, tag: 1)
        let thirdTabItem = UITabBarItem(title: "", image: resizedSearchImage, tag: 2)
        let fourthTabItem = UITabBarItem(title: "", image: resizedProfileImage, tag: 3)

        galleryVC.tabBarItem = firstTabItem
        profileLoginVC.tabBarItem = secondTabItem
        searchVC.tabBarItem = thirdTabItem
        profileLogoutVC.tabBarItem = fourthTabItem
        
        // Set the view controllers for the TabBarController
        self.viewControllers = [galleryVC, profileLoginVC, searchVC,profileLogoutVC]
        
        // Optional: Customize the appearance of the TabBar
        customizeTabBarAppearance()
    }
    
        class func instanciate() -> TabBarVC {
                let vc = TabBarVC()
                return vc
            }
    
    private func customizeTabBarAppearance() {
        tabBar.tintColor = .darkPink
        tabBar.unselectedItemTintColor = .white
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .app
    }
    
    func resizedImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let ratio = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, false, image.scale)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage ?? image
    }
}







