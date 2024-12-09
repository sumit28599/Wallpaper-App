//
//  SignUPVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 05/12/24.
//

import UIKit

class SignUPVC: UIViewController {
    
    private var customView = CustomView()
    private var nameStackView = UIStackView()
    private var nameLabel = UILabel()
    private var nameTextField = UITextField()
    private var nameLineView = UIView()
    private var emailStackView = UIStackView()
    private var emailLabel = UILabel()
    private var emailTextField = UITextField()
    private var emailLineView = UIView()
    private var passwordStackView = UIStackView()
    private var passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private var passwordLineView = UIView()
    private var registerButton = UIButton()
    private var loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        self.view.backgroundColor = .app
        
        // Set the CustomView
        setupCustomView()
        
        
        // Set the Name View
        setupNameUI()
        
        // Set the Email View
        setupEmailUI()
        
        // Set the Password View
        setupPasswordUI()
        
        // Set the Register Button View
        setupRegisterButton()
        
        // Set the Login Button View
        setupLoginButton()
        
        
        
    }
    
    class func instanciate() -> SignUPVC {
        let vc = SignUPVC()
        return vc
    }
    
    
    // MARK: - Setup Custom view  UI
    func setupCustomView() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            customView.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor),
            customView.widthAnchor.constraint(equalToConstant: 190),
            customView.heightAnchor.constraint(equalToConstant: 170)
        ])
        
        customView.setTitle("Sign UP")
    }
    
   
    // MARK: - Setup Name UI
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
            nameLabel.heightAnchor.constraint(equalToConstant: 35),
            nameTextField.heightAnchor.constraint(equalToConstant: 35),
            nameLineView.heightAnchor.constraint(equalToConstant: 1),
            nameStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),  // Center horizontally
            nameStackView.topAnchor.constraint(equalTo: customView.bottomAnchor,constant: 50),  // Center vertically
            nameStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
            nameStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameStackView.heightAnchor.constraint(equalToConstant: 91)// Right margin
        ])
    }
    
    // MARK: - Setup Email UI
    
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
            emailStackView.topAnchor.constraint(equalTo: nameStackView.bottomAnchor,constant: 20),  // Center vertically
            emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
            emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailStackView.heightAnchor.constraint(equalToConstant: 91)// Right margin
        ])
    }
    
    // MARK: - Setup Password UI
    func setupPasswordUI() {
        passwordLineView.frame.size.height = 1
        passwordLineView.backgroundColor = UIColor.white
        
        passwordLabel.text = "Password"
        passwordLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 19)
        passwordLabel.textColor = .white
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordPlaceholder = "Password"
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: passwordPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        passwordTextField.textColor = .white
        passwordTextField.backgroundColor = .clear
        passwordTextField.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true
        
        passwordStackView.axis = .vertical
        passwordStackView.spacing = 10
        passwordStackView.alignment = .fill
        passwordStackView.translatesAutoresizingMaskIntoConstraints = false
        passwordStackView.addArrangedSubview(passwordLabel)
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(passwordLineView)
        
        self.view.addSubview(passwordStackView)
        
        NSLayoutConstraint.activate([
            passwordLabel.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordLineView.heightAnchor.constraint(equalToConstant: 1),
            passwordStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordStackView.topAnchor.constraint(equalTo: emailStackView.bottomAnchor, constant: 20),
            passwordStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordStackView.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    // MARK: - Setup Register Button UI
    func setupRegisterButton() {
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .darkPink
        registerButton.layer.cornerRadius = 25 // Capsule shape
        registerButton.layer.masksToBounds = true
        registerButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.setTitleColor(.white, for: .normal)
        
        self.view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 30),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    
    // MARK: - Setup Sign-Up Button UI
    func setupLoginButton() {
        loginButton.setTitle("Already have an account ? Login", for: .normal)
        loginButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .clear
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: registerButton.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        loginButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Sign-Up Button Action
    @objc func signUpButtonTapped() {
        print("Sign-Up button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = LoginVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
    // MARK: - Login Button Action
    @objc func registerButtonTapped() {
        print("Register button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = LoginVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
}
