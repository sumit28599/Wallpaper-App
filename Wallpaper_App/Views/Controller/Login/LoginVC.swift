//
//  LoginVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 04/12/24.
//

import UIKit


class LoginVC: UIViewController {
    
    private var imageView = UIImageView()
    private var logintext = UILabel()
    private var emailStackView = UIStackView()
    private var emailLabel = UILabel()
    private var emailTextField = UITextField()
    private var emailLineView = UIView()
    private var passwordStackView = UIStackView()
    private var passwordLabel = UILabel()
    private var passwordTextField = UITextField()
    private var passwordLineView = UIView()
    private var loginButton = UIButton()
    private var forgotPasswordButton = UIButton()
    private var signUpButton = UIButton()
    private var googleLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        self.view.backgroundColor = .app
        
        // Set the ImageView
        setupImageView()
        
        // Set the Login Text
        setupLabel()
        
        // Set the Email View
        setupEmailUI()
        
        // Set the Password View
        setupPasswordUI()
        
        // Set the Forgot Password View
        setupForgotPasswordButton()
        
        // Set the Login Button View
        setupLoginButton()
        
        // Set the SignUp Button View
        setupSignUpButton()
        
        // Set the Login with google Button View
        setupLoginWithGoogle()
    }
    
    class func instanciate() -> LoginVC {
        let vc = LoginVC()
        return vc
    }
    
    
    //MARK: Set the ImageView UI
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
    
    //MARK: Set the Login UI
    func setupLabel() {
        logintext.font = .font(family: .poppins, sizeFamily: .semibold, size: 34)
        logintext.text = "Login"
        logintext.textColor = .white
        view.addSubview(logintext)
        logintext.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logintext.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            logintext.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
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
            emailStackView.topAnchor.constraint(equalTo: logintext.bottomAnchor,constant: 50),  // Center vertically
            emailStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // Left margin
            emailStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailStackView.heightAnchor.constraint(equalToConstant: 90)// Right margin
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
            passwordStackView.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    // MARK: - Setup Login Button UI
    func setupLoginButton() {
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .darkPink
        loginButton.layer.cornerRadius = 25 // Capsule shape
        loginButton.layer.masksToBounds = true
        loginButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(.white, for: .normal)
        self.view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
    //MARK: Set UP Forgot Password Button
    func setupForgotPasswordButton() {
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        forgotPasswordButton.setTitleColor(.white, for: .normal)
        forgotPasswordButton.backgroundColor = .clear
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(forgotPasswordButton)
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordStackView.bottomAnchor, constant: 20),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20)
        ])
        
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup Sign-Up Button UI
    func setupSignUpButton() {
        signUpButton.setTitle("Don't have an account? Sign Up", for: .normal)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .clear
        signUpButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 14)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(signUpButton)
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Setup "Or login with" Section UI
    
    func setupLoginWithGoogle() {
        let separatorView = SeparatorWithTextView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(separatorView)
        
        // Google login button
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        googleLoginButton.layer.masksToBounds = true
        googleLoginButton.setImage(UIImage(named: "google_logo"), for: .normal)
        googleLoginButton.imageView?.contentMode = .scaleAspectFit
        self.view.addSubview(googleLoginButton)
        
        NSLayoutConstraint.activate([
            // Separator View Constraints
            separatorView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 30),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            separatorView.heightAnchor.constraint(equalToConstant: 20),
            
            googleLoginButton.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 20),
            googleLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            googleLoginButton.widthAnchor.constraint(equalToConstant: 40),
            googleLoginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        googleLoginButton.addTarget(self, action: #selector(googleLoginButtonTapped), for: .touchUpInside)
    }
    
    //MARK: Tapped google button
    @objc func googleLoginButtonTapped() {
        debugPrint("Google Login button tapped")
    }
    
    
    
    // MARK: - Sign-Up Button Action
    @objc func signUpButtonTapped() {
        debugPrint("Sign-Up button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = SignUPVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
    
    
    // MARK: - Login Button Action
    @objc func loginButtonTapped() {
        debugPrint("Login button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = TabBarVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
    
    //MARK: Tapped forgot button
    @objc func forgotPasswordButtonTapped() {
        debugPrint("Forgot Password button tapped")
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let vc = ForgotPasswordVC.instanciate()
            UIStoryboard.makeNavigationControllerAsRootVC(vc)
        }
    }
}





import UIKit

class SeparatorWithTextView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Create the left line
        let leftLine = UIView()
        leftLine.backgroundColor = UIColor.lightGray
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the right line
        let rightLine = UIView()
        rightLine.backgroundColor = UIColor.lightGray
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        
        // Create the label
        let label = UILabel()
        label.text = "Or login with"
        label.textColor = UIColor.lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        addSubview(leftLine)
        addSubview(label)
        addSubview(rightLine)
        
        // Add constraints
        NSLayoutConstraint.activate([
            // Left Line
            leftLine.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            leftLine.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            leftLine.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: 1),
            
            // Label
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Right Line
            rightLine.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            rightLine.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            rightLine.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}


