//
//  PrivacyPolicyVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 07/12/24.
//

import UIKit

class PrivacyPolicyVC: UIViewController {
    private var backButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .app
        
        // Set back button view
        backButtonView()
        
        // Set require view
        setupUI()
        
    }
    class func instanciate() -> PrivacyPolicyVC {
        let vc = PrivacyPolicyVC()
        return vc
    }
    
    //MARK: Set back button view
    func backButtonView() {
        if let image = UIImage(named: "backButton") {
            backButton.setImage(image, for: .normal)
        }
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    //MARK: Set require ui
    func setupUI() {
        let titleLabel = UILabel()
        titleLabel.text = "Privacy Policy"
        titleLabel.textColor = .white
        titleLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "splash")
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        let points = [
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        ]
        
        let pointsStackView = UIStackView()
        pointsStackView.axis = .vertical
        pointsStackView.spacing = 16
        pointsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        for point in points {
            let pointView = createBulletPointView(text: point)
            pointsStackView.addArrangedSubview(pointView)
        }
        
        view.addSubview(pointsStackView)
        
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
            
            pointsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            pointsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            pointsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    //MARK: Create bullet button view
    
    func createBulletPointView(text: String) -> UIView {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        let bulletImageView = UIImageView()
        bulletImageView.image = UIImage(named: "circle")
        bulletImageView.contentMode = .scaleAspectFit
        bulletImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.textColor = .white
        textLabel.font = .font(family: .poppins, sizeFamily: .regular, size: 16)
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(bulletImageView)
        containerView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            bulletImageView.widthAnchor.constraint(equalToConstant: 10),
            bulletImageView.heightAnchor.constraint(equalToConstant: 10),
            bulletImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            bulletImageView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 8),
            
            textLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: bulletImageView.trailingAnchor, constant: 8),
            textLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        return containerView
    }
    
    //MARK: Tapped Back button
    @objc func backButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
