//
//  ContactUsVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import UIKit

class ContactUsVC: UIViewController {
    
    private var customView = CustomView()
    private var contactText = UILabel()
    private var nameStackView = UIStackView()
    private var nameLabel = UILabel()
    private var nameTextField = UITextField()
    private var nameLineView = UIView()
    private var emailStackView = UIStackView()
    private var emailLabel = UILabel()
    private var emailTextField = UITextField()
    private var emailLineView = UIView()
    private var messageStackView = UIStackView()
    private var messageLabel = UILabel()
    private var messageTextField = UITextField()
    private var messageLineView = UIView()
    private var backButton = UIButton()
    private var submitButton = UIButton()
    private var loginButton = UIButton()
    private var googleLoginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        self.view.backgroundColor = .app
        
        // Set the Back Button View
        setupBackButton()
        
        // Set the contact label text
        setupContactLabel()
        
        // Set the ImageView
        setupcustomView()
        
        // Set the Name View
        setupNameUI()
        
        // Set the Email View
        setupEmailUI()
        
        // Set the Password View
        setupMessageUI()
        
        // Set the Submit Button View
        setupSubmitButton()
        
        
    }
    
    class func instanciate() -> ContactUsVC {
            let vc = ContactUsVC()
            return vc
        }
    
    
    //MARK:  Set the contact label text
    func setupContactLabel() {
        contactText.font = .font(family: .poppins, sizeFamily: .semibold, size: 25)
        contactText.text = "Contact us"
        contactText.textColor = .white
        contactText.textAlignment = .right
        view.addSubview(contactText)
        contactText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contactText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactText.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: 20)
        ])

    }
    
    
    // MARK: - Setup Back Button UI
    func setupBackButton() {
        if let image = UIImage(named: "backButton") {
            backButton.setImage(image, for: .normal)
        }
        backButton.tintColor = .white
        backButton.backgroundColor = .clear
        backButton.imageView?.frame.size = CGSize(width: 20, height: 20)
        backButton.imageView?.contentMode = .scaleAspectFit
        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -5, bottom: 0, right: 5)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(backButton)
        
        // Login Button Constraints
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        // Add action to login button
        backButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    //MARK:  Set the ImageView
    
        func setupcustomView() {
            customView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(customView)
    
            NSLayoutConstraint.activate([
                customView.topAnchor.constraint(equalTo: contactText.bottomAnchor, constant: 40),
                customView.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor),
                customView.widthAnchor.constraint(equalToConstant: 190),
                customView.heightAnchor.constraint(equalToConstant: 170),
             
            ])
    
        }
    
    
    //MARK:  Set the Name View
    
    func setupNameUI() {
        nameLineView.frame.size.height = 1
        nameLineView.backgroundColor = UIColor.white
        nameLabel.text = "Name"
        nameLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 19)
        nameLabel.textColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = "Enter your name"
        nameTextField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        nameTextField.textColor = .white
        nameTextField.backgroundColor = .clear
        nameTextField.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.axis = .vertical
        nameStackView.spacing = 10
        nameStackView.alignment = .fill
        nameStackView.translatesAutoresizingMaskIntoConstraints = false
        nameStackView.addArrangedSubview(nameLabel)
        nameStackView.addArrangedSubview(nameTextField)
        nameStackView.addArrangedSubview(nameLineView)
        
        self.view.addSubview(nameStackView)

        NSLayoutConstraint.activate([
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameTextField.heightAnchor.constraint(equalToConstant: 40),
            nameLineView.heightAnchor.constraint(equalToConstant: 1),
            nameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center horizontally
            nameStackView.topAnchor.constraint(equalTo: customView.bottomAnchor,constant: 50),  // Center vertically
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
            nameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameStackView.heightAnchor.constraint(equalToConstant: 71)// Right margin
               ])
    }
    
    //MARK: - Setup Email UI
    func setupEmailUI() {
        emailLineView.frame.size.height = 1
        emailLineView.backgroundColor = UIColor.white
        emailLabel.text = "Email"
        emailLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 19)
        emailLabel.textColor = .white
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        let placeholderText = "Your email id"
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        emailTextField.textColor = .white
        emailTextField.backgroundColor = .clear
        emailTextField.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.axis = .vertical
        emailStackView.spacing = 10
        emailStackView.alignment = .fill
        emailStackView.translatesAutoresizingMaskIntoConstraints = false
        emailStackView.addArrangedSubview(emailLabel)
        emailStackView.addArrangedSubview(emailTextField)
        emailStackView.addArrangedSubview(emailLineView)
        self.view.addSubview(emailStackView)
        NSLayoutConstraint.activate([
            emailLabel.heightAnchor.constraint(equalToConstant: 30),
                   emailTextField.heightAnchor.constraint(equalToConstant: 40),
                   emailLineView.heightAnchor.constraint(equalToConstant: 1),
                   emailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center horizontally
            emailStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor,constant: 20),  // Center vertically
                   emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
                   emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   emailStackView.heightAnchor.constraint(equalToConstant: 71)// Right margin
               ])
    }
    
    // MARK: - Setup Message UI
    func setupMessageUI() {
        messageLineView.frame.size.height = 1
        messageLineView.backgroundColor = UIColor.white
        messageLabel.text = "Message"
        messageLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 19)
        messageLabel.textColor = .white
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        let messagePlaceholder = "Enter your message"
        messageTextField.attributedPlaceholder = NSAttributedString(
            string: messagePlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        messageTextField.textColor = .white
        messageTextField.backgroundColor = .clear
        messageTextField.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        messageTextField.isSecureTextEntry = true
        messageStackView.axis = .vertical
        messageStackView.spacing = 10
        messageStackView.alignment = .fill
        messageStackView.translatesAutoresizingMaskIntoConstraints = false
        messageStackView.addArrangedSubview(messageLabel)
        messageStackView.addArrangedSubview(messageTextField)
        messageStackView.addArrangedSubview(messageLineView)
        
        self.view.addSubview(messageStackView)
        NSLayoutConstraint.activate([
            messageLabel.heightAnchor.constraint(equalToConstant: 30),
            messageTextField.heightAnchor.constraint(equalToConstant: 40),
            messageLineView.heightAnchor.constraint(equalToConstant: 1),
            messageStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 20),
            messageStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            messageStackView.heightAnchor.constraint(equalToConstant: 71)
        ])
    }
    
    // MARK: - Setup Login Button UI
    func setupSubmitButton() {
        // Create the Login Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = .darkPink
        submitButton.layer.cornerRadius = 25 // Capsule shape
        submitButton.layer.masksToBounds = true
        submitButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitleColor(.white, for: .normal)
        
        self.view.addSubview(submitButton)
        
        // Login Button Constraints
        NSLayoutConstraint.activate([
            submitButton.topAnchor.constraint(equalTo: messageStackView.bottomAnchor, constant: 30),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add action to login button
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Submit Button Action
    @objc func submitButtonTapped() {
        debugPrint("Submit button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = LoginVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
    // MARK: - Back Button Action
    @objc func backButtonTapped() {
        debugPrint("Back button tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
}
