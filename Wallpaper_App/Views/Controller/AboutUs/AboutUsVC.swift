//
//  AboutUsVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 07/12/24.
//

import UIKit

class AboutUsVC: UIViewController {
    
    
    private var backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .app
        
        // Set back button view
        backButtonAction()
        
        // Set UI view
        setupUI()
    }
    
    class func instanciate() -> AboutUsVC {
        let vc = AboutUsVC()
        return vc
    }
    
    //MARK: Set back button
    func backButtonAction () {
        if let image = UIImage(named: "backButton") {
            backButton.setImage(image, for: .normal)
        }
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    
    //MARK: Set Info view and Disclaimer view
    
    func setupUI() {
       
        
        // "About Us" Label
        let titleLabel = UILabel()
        titleLabel.text = "About us"
        titleLabel.textColor = .white
        titleLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Logo ImageView
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "splash") // Replace with your logo image name
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        // Info Section
        let infoView = createSectionView(title: "Info", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.")
        view.addSubview(infoView)
        
        // Disclaimer Section
        let disclaimerView = createSectionView(title: "Disclaimer", text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.\n\nLorem Ipsum is simply dummy text of the printing and typesetting industry.")
        view.addSubview(disclaimerView)
        
        // Constraints
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 35),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            
            titleLabel.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 16),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 190),
            logoImageView.heightAnchor.constraint(equalToConstant: 170),
            
            infoView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            disclaimerView.topAnchor.constraint(equalTo: infoView.bottomAnchor, constant: 20),
            disclaimerView.leadingAnchor.constraint(equalTo: infoView.leadingAnchor),
            disclaimerView.trailingAnchor.constraint(equalTo: infoView.trailingAnchor)
        ])
    }
    
    
    //MARK: Set Section view
    
    func createSectionView(title: String, text: String) -> UIView {
        let containerView = UIView()
        containerView.backgroundColor = UIColor(white: 0.2, alpha: 1) // Darker gray
        containerView.layer.cornerRadius = 12
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.textColor = .white
        textLabel.font = UIFont.systemFont(ofSize: 14)
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            textLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16)
        ])
        
        return containerView
    }
    
    
    //MARK: Set Back button action tapped
    @objc func backButtonTapped() {
        print("Back button tapped")
        self.dismiss(animated: true, completion: nil)
        
    }
}
