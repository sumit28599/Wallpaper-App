//
//  ProfileLoginVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import UIKit

class ProfileLoginVC: UIViewController {
    
    private var tableView: UITableView!
    private var profileText = UILabel()
    private var backButton = UIButton()
    private var profileImage = UIImageView()
    private var loginButton = UIButton()

    let data = [ProfileModel(name: "My wishList", imageName: "wishlist"),ProfileModel(name: "About Us", imageName: "aboutus"),ProfileModel(name: "Privacy Policy", imageName: "privacy"),ProfileModel(name: "Share", imageName: "sharepro"),ProfileModel(name: "Theme Mode", imageName: "theme"),ProfileModel(name: "Contact Us", imageName: "contactus")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .app
        
        // Set back button view
        setupBackButton()
        
        // Set label
        setupLabel()
        
        // Set profile image view
        setupProfileImageView()
        
        // Set login button view
        setupLoginButton()
        
        // Set table view
        setUpTableView()
        
    }
    
    class func instanciate() -> ProfileLoginVC {
        let vc = ProfileLoginVC()
        return vc
    }
    
    //MARK: Set up UI Label
    func setupLabel() {
        profileText.font = .font(family: .poppins, sizeFamily: .semibold, size: 25)
        profileText.text = "Profile"
        profileText.textColor = .white
        view.addSubview(profileText)
        profileText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileText.leadingAnchor.constraint(equalTo: backButton.trailingAnchor,constant: 20)
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
        
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    
        func setupProfileImageView() {
            profileImage.image = UIImage(named: "profileimage")
            profileImage.layer.cornerRadius = 50
            profileImage.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(profileImage)
    
            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: profileText.bottomAnchor, constant: 40),
                profileImage.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor),
                profileImage.widthAnchor.constraint(equalToConstant: 100),
                profileImage.heightAnchor.constraint(equalToConstant: 100)
            ])
    
            profileImage.contentMode = .scaleAspectFit
    
        }
    
    //MARK: Set Table view UI
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 50
        tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 34),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: Set Login button View UI
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
            loginButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 30),
           // logoutButton.bottomAnchor.constraint(equalTo: .bottomAnchor,constant: -20),
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        loginButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
   
    // MARK: - Back Button Action
    
    @objc func backButtonTapped() {
        debugPrint("Back button tapped!")
        self.dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
       
    }
    
    // MARK: - Logout Button Action
    @objc func logoutButtonTapped() {
        debugPrint("LogOut button tapped!")
        self.dismiss(animated: true, completion: nil)
       
    }
    
    // MARK: - Switch Action
    
    @objc func switchToggled(_ sender: UISwitch) {
        // Perform some action based on the switch state
        if sender.isOn {
            print("Switch is ON")
        } else {
            print("Switch is OFF")
        }
        
        // You can also access the cell where the switch was toggled
        if let cell = sender.superview?.superview as? ProfileTableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            debugPrint("Switch toggled in row \(indexPath?.row ?? -1)")
        }
    }
}


// MARK: - TableView Delegate and datasource

extension ProfileLoginVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! ProfileTableViewCell
        
        cell.titleLabel.text = data[indexPath.row].name
        cell.profileImageView.image = UIImage(named: data[indexPath.row].imageName)
        cell.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        cell.backgroundColor = .clear
        cell.toggleSwitch.addTarget(self, action: #selector(switchToggled(_:)), for: .valueChanged)
        if indexPath.row == 4 {
            cell.toggleSwitch.isHidden = false
            cell.backButton.isHidden = true
        } else {
            cell.toggleSwitch.isHidden = true
            cell.backButton.isHidden = false    
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if data[indexPath.row].imageName == "privacy" {
            
        } else if data[indexPath.row].imageName == "privacy" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let vc = PrivacyPolicyVC.instanciate()
                UIStoryboard.makeNavigationControllerAsRootVC(vc)
            }
        } else if data[indexPath.row].imageName == "aboutus" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let vc = AboutUsVC.instanciate()
                UIStoryboard.makeNavigationControllerAsRootVC(vc)
            }
        } else if data[indexPath.row].imageName == "contactus" {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                let vc = ContactUsVC.instanciate()
                UIStoryboard.makeNavigationControllerAsRootVC(vc)
            }
        } else {
            
        }
    }
    
    
    
}



