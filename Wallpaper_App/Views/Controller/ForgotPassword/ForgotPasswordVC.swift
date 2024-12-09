//
//  ForgotPasswordVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 05/12/24.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    
    private var imageView = UIImageView()
    private var forgotText = UILabel()
    private var emailStackView = UIStackView()
    private var emailLabel = UILabel()
    private var emailTextField = UITextField()
    private var emailLineView = UIView()
    private var submitButton = UIButton()
    private var loginButton = UIButton()
      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        self.view.backgroundColor = .app
        
        // Set Image view
        setupImageView()
        
        // Set Label
        setForgotLabel()
        
        // Set Email view
        setupEmailUI()
        
        // Set Submit button view
        setupSubmitButton()
        
        // Set login button view
        setupLoginButton()
    }
    
    class func instanciate() -> ForgotPasswordVC {
            let vc = ForgotPasswordVC()
            return vc
        }
    
    //MARK: Set up image view
        func setupImageView() {
            imageView.image = UIImage(named: "splash")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(imageView)
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
                imageView.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor),
                imageView.widthAnchor.constraint(equalToConstant: 190),
                imageView.heightAnchor.constraint(equalToConstant: 168)
            ])
    
            imageView.contentMode = .scaleAspectFit
    
        }
    
    //MARK: Set up forgot text
        func setForgotLabel() {
            forgotText.font = .font(family: .poppins, sizeFamily: .semibold, size: 34)
            forgotText.text = "Forgot Password"
            forgotText.textColor = .white
            view.addSubview(forgotText)
            forgotText.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                forgotText.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
                forgotText.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
            ])
    
        }
    
    //MARK: Set up email view
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
            emailLabel.heightAnchor.constraint(equalToConstant: 35),
                   emailTextField.heightAnchor.constraint(equalToConstant: 35),
                   emailLineView.heightAnchor.constraint(equalToConstant: 1),
                   emailStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center horizontally
            emailStackView.topAnchor.constraint(equalTo: forgotText.bottomAnchor,constant: 130),  // Center vertically
                   emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
                   emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                   emailStackView.heightAnchor.constraint(equalToConstant: 91)// Right margin
               ])
    }
    
    
    
    // MARK: - Setup Submit Button UI
    func setupSubmitButton() {
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
            submitButton.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 40),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            submitButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        // Add action to login button
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Setup login Button UI
       func setupLoginButton() {
           loginButton.setTitle("Back to Login", for: .normal)
           loginButton.setTitleColor(.white, for: .normal)
           loginButton.backgroundColor = .clear
           loginButton.titleLabel?.font = .systemFont(ofSize: 14)
           loginButton.translatesAutoresizingMaskIntoConstraints = false
           
           self.view.addSubview(loginButton)
           
           NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
               loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
           
           loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
       }
       
       // MARK: - Login Button Action
       @objc func loginButtonTapped() {
           debugPrint("Login button tapped")
       }
   



    // MARK: - Submit Button Action
    @objc func submitButtonTapped() {
        debugPrint("Submit button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = LoginVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
}
