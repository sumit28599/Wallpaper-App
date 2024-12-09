//
//  SplashVC.swift
//  WallpaperApp
//
//  Created by BigOh on 04/12/24.
//

import UIKit

class SplashVC: UIViewController {
    
    private var label1 = UILabel()
    private var myLabel = UILabel()
    private var imageView = UIImageView()
    private var loaderImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
            let vc = HomeVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
        
        // Setup Lable Text UI
        setupLabel()
        
        // Setup Logo Image View UI
        setupImageView()
        
        // Setup Stack View UI
        setupStackView()
        
        // Setup Loader Animation View UI
        startLoaderAnimation()
    }
    
    //MARK: Setup Lable Text UI
    func setupLabel() {
        label1.font = .font(family: .poppins, sizeFamily: .bold, size: 18)
        label1.text = "Created By"
        label1.textColor = .white
        myLabel.text = "appsmaverick.studio"
        myLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        myLabel.textColor = .darkPink
        self.view.addSubview(myLabel)
        myLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: Setup Logo Image View UI
    func setupImageView() {
        imageView.image = UIImage(named: "splash")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 162),
            imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -46),
            imageView.widthAnchor.constraint(equalToConstant: 486),
            imageView.heightAnchor.constraint(equalToConstant: 412)
        ])
        
        imageView.contentMode = .scaleAspectFit
        
        loaderImageView.image = UIImage(named: "Loader")
        loaderImageView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loaderImageView)
        
        NSLayoutConstraint.activate([
            loaderImageView.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 134),
            loaderImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loaderImageView.widthAnchor.constraint(equalToConstant: 84),
            loaderImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        loaderImageView.contentMode = .scaleAspectFit
    }
    
    //MARK: Setup Stack View UI
    func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [label1, myLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2
        stackView.distribution = .fillProportionally
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.topAnchor.constraint(equalTo: loaderImageView.bottomAnchor,constant: 15),
            stackView.heightAnchor.constraint(equalToConstant: 27)
        ])
    }
    
    //MARK: Setup Loader Animation View UI
    func startLoaderAnimation() {
            let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotationAnimation.fromValue = 0
            rotationAnimation.toValue = (2 * Double.pi)
            rotationAnimation.duration = 1
            rotationAnimation.repeatCount = .infinity
            rotationAnimation.isRemovedOnCompletion = false
            rotationAnimation.fillMode = .forwards
            self.loaderImageView.layer.add(rotationAnimation, forKey: "rotateAnimation")
        }
}

