//
//  UIStoryboard+Navigations.swift
//  Digi Lawyer
//
//  Created by Mohd Haris on 14/11/24.
//

import UIKit

extension UIStoryboard {
    static let home = UIStoryboard(name : "Home", bundle: .main)
    static let splash = UIStoryboard(name : "Splash", bundle: .main)
    
    func instanceOf<T: UIViewController>(viewController: T.Type) ->T? {
        let x = String(describing: viewController.self)
        let vc = self.instantiateViewController(withIdentifier: x) as? T
        vc?.modalPresentationStyle = .fullScreen
        return vc
    }
    
    static func makeNavigationControllerAsRootVC( _ viewController: UIViewController) {
        let navigation = UINavigationController(rootViewController: viewController)
        navigation.setNavigationBarHidden(true, animated: false)
        navigation.modalPresentationStyle = .fullScreen
        AppDelegate.shared().window?.rootViewController = navigation
        AppDelegate.shared().window?.makeKeyAndVisible()
    }
}
