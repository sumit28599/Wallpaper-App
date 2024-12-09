//
//  HomeVC.swift
//  WallpaperApp
//
//  Created by BigOh on 04/12/24.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .app
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = GalleryVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
    class func instanciate() -> HomeVC {
        let vc = UIStoryboard.home.instanceOf(viewController: HomeVC.self)!        
        return vc
    }

}




