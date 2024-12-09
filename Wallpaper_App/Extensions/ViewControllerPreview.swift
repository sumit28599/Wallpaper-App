//
//  ViewControllerPreview.swift
//  Digi Lawyer
//
//  Created by Mohd Haris on 14/11/24.
//

import SwiftUI
import UIKit

struct ViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    

    let viewControllerBuilder: () -> ViewController
    
    init(_ builder: @escaping () -> ViewController) {
        self.viewControllerBuilder = builder
    }
    

    func makeUIViewController(context: Context) -> ViewController {
        return viewControllerBuilder()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) { }
}
