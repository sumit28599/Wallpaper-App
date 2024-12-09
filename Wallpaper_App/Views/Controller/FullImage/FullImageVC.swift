//
//  FullImageVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 05/12/24.
//

import UIKit

class FullImageVC: UIViewController {
    
    private var imageView = UIImageView()
    private var stackView = UIStackView()
    private var showInfoButton = UIButton()
    private var backButton = UIButton()
    private var infoView = UIView()
    private var authorLabel = UILabel()
    private var sourceLabel = UILabel()
    var imageUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        // Set full screen image
        setImageView()
        
        // Set stack for three buttons
        setStackView()
        
        // Set up the info button
        setupInfoButton()
        
        // Set up the back button
        setBackButton()
        
        // Set up the info view
        setupInfoView()
        
        
    }
    
    class func instanciate() -> FullImageVC {
        let vc = FullImageVC()
        return vc
    }
    
    
    //MARK: Setup info button properties
    func setupInfoButton() {
        showInfoButton.frame = CGRect(x: view.safeAreaLayoutGuide.layoutFrame.width - 70, y: 55, width: 40, height: 40)
        showInfoButton.backgroundColor = .clear
        if let image = UIImage(named: "aboutUsBlack") {
            showInfoButton.setImage(image, for: .normal)
        }
        showInfoButton.addTarget(self, action: #selector(showInfoView), for: .touchUpInside)
        
        view.addSubview(showInfoButton)
    }
    
    func setBackButton() {
        backButton.frame = CGRect(x: 20, y: 55, width: 40, height: 40)
        backButton.backgroundColor = .clear
        if let image = UIImage(named: "blackBackButton") {
            backButton.setImage(image, for: .normal)
        }
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
   
    //MARK: Setup info view and labels
    func setupInfoView() {
        infoView.frame = CGRect(x: 150, y: 100, width: 250, height: 80)
        infoView.backgroundColor = .white
        infoView.layer.cornerRadius = 10
        infoView.isHidden = true
        
        // Setup name label
        authorLabel.frame = CGRect(x: 20, y: 10, width: 260, height: 20)
        authorLabel.text = "Name: John Doe"
        authorLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        authorLabel.textColor = .black
        
        // Setup email label
        sourceLabel.frame = CGRect(x: 20, y: 40, width: 260, height: 20)
        sourceLabel.text = "Email: johndoe@example.com"
        sourceLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        sourceLabel.textColor = .black
        
        // Add labels to the info view
        infoView.addSubview(authorLabel)
        infoView.addSubview(sourceLabel)
        
        // Add the info view to the main view
        view.addSubview(infoView)
    }
    
    //MARK: back Button action to show previous view
    @objc func backButtonTapped() {
        print("Back button tapped!")
        self.dismiss(animated: true, completion: nil)
        
    }
    //MARK: Button action to show info view
    @objc func showInfoView() {
        // Toggle the visibility of the info view
        infoView.isHidden = !infoView.isHidden
    }
    
    //MARK: Setup Image view
    func setImageView() {
        imageView = UIImageView(frame: self.view.bounds)
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = true
        self.view.addSubview(imageView)
        imageView.layer.zPosition = -1
        if let url = URL(string: imageUrl) {
            imageView.load(url: url)
        }
    }
    
    //MARK: Setup stack view
    func setStackView() {
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.backgroundColor = .clear
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let shareButton = createButton(image: "share")
        let likeButton = createButton(image: "heartsmall")
        let downloadButton = createButton( image: "download")
        
        // 5. Add buttons to the stack view
        stackView.addArrangedSubview(shareButton)
        stackView.addArrangedSubview(downloadButton)
        stackView.addArrangedSubview(likeButton)
        
        // 6. Add the stack view to the main view
        self.view.addSubview(stackView)
        
        // 7. Set up the constraints for the stack view
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 80),
            stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -80),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    //MARK: Setup create button view
    private func createButton(image: String) -> UIButton {
        let button = UIButton()
        if let image = UIImage(named: image) {
            button.setImage(image, for: .normal)
        }
        button.backgroundColor = .clear
        return button
    }
}



