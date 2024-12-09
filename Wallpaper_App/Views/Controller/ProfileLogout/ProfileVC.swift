//
//  ProfileVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import UIKit

class ProfileVC: UIViewController {
    
    private var tableView: UITableView!
    private var profileText = UILabel()
    private var profileNameText = UILabel()
    private var emailText = UILabel()
    private var numberText = UILabel()
    private var backButton = UIButton()
    private var profileImage = UIImageView()
    private var logoutButton = UIButton()
    let data = [ProfileModel(name: "My wishList", imageName: "wishlist"),ProfileModel(name: "About Us", imageName: "aboutus"),ProfileModel(name: "Privacy Policy", imageName: "privacy"),ProfileModel(name: "Share", imageName: "sharepro"),ProfileModel(name: "Theme Mode", imageName: "theme"),ProfileModel(name: "Contact Us", imageName: "contactus")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .app
        
        //Set button View
        setupBackButton()
        
        //Set Profile Text Label View
        setupProfileTextLabel()
        
        //Set Profile Image View
        setupProfileImageView()
        
        //Set Name Label View
        setNameLabel()
        
        //Set Email Label View
        setEmailLabel()
        
        //Set Number Label View
        setNumberLabel()
        
        //Set Table  View
        setUpTableView()
        
        //Set Logout button  View
        setupLogOutButton()
    }
    
    class func instanciate() -> ProfileVC {
        let vc = ProfileVC()
        return vc
    }
    
    //MARK: Set Profile Text Label View
    func setupProfileTextLabel() {
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
    
    //MARK: Set Name Label View
    func setNameLabel() {
        profileNameText.font = .font(family: .poppins, sizeFamily: .semibold, size: 25)
        profileNameText.text = "Varun Gupta"
        profileNameText.textColor = .white
        profileNameText.textAlignment = .center
        view.addSubview(profileNameText)
        profileNameText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileNameText.topAnchor.constraint(equalTo: profileImage.bottomAnchor,constant: 20),
            profileNameText.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor)
        ])
        
    }
    
    //MARK: Set Email Label View
    func setEmailLabel() {
        emailText.font = .font(family: .poppins, sizeFamily: .semibold, size: 25)
        emailText.text = "varun2345@gamil.com"
        emailText.textColor = .white
        emailText.textAlignment = .center
        emailText.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emailText)
        
        NSLayoutConstraint.activate([
            emailText.topAnchor.constraint(equalTo: profileNameText.bottomAnchor,constant: 5),
            emailText.centerXAnchor.constraint(equalTo: profileImage.centerXAnchor)
        ])
        
    }
    
    //MARK: Set Number Label View
    func setNumberLabel() {
        numberText.font = .font(family: .poppins, sizeFamily: .semibold, size: 25)
        numberText.text = "+91 1234567890"
        numberText.textColor = .white
        numberText.textAlignment = .center
        view.addSubview(numberText)
        numberText.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberText.topAnchor.constraint(equalTo: emailText.bottomAnchor,constant: 5),
            numberText.centerXAnchor.constraint(equalTo: emailText.centerXAnchor)
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
        
        // Add action to login button
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    
    //MARK: Set Profile Image View
    
    func setupProfileImageView() {
        profileImage.image = UIImage(named: "profileimage")
        profileImage.layer.cornerRadius = 50
        profileImage.layer.masksToBounds = true // Ensure the image is clipped to the circular shape
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileImage)
        
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: profileText.bottomAnchor, constant: 40),
            profileImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        profileImage.contentMode = .scaleAspectFit
        
        let editButton = UIButton()
        editButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        editButton.layer.cornerRadius = editButton.frame.size.width / 2
        editButton.clipsToBounds = true
        editButton.backgroundColor = .darkPink
        
        if let image = UIImage(named: "editimage") {
            editButton.setImage(image, for: .normal)
            editButton.imageView?.contentMode = .scaleAspectFit
        }
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editButton)
        
        NSLayoutConstraint.activate([
            editButton.bottomAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: -8),
            editButton.trailingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 5),
            editButton.widthAnchor.constraint(equalToConstant: 30),
            editButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        editButton.addTarget(self, action: #selector(editProfile), for: .touchUpInside)
    }

    @objc func editProfile() {
        print("Edit button tapped")
    }

    
    //MARK: Set Table View
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
            tableView.topAnchor.constraint(equalTo: numberText.bottomAnchor,constant: 34),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    //MARK: Set Logout Button View
    func setupLogOutButton() {
        // Create the Login Button
        logoutButton.setTitle("Logout", for: .normal)
        logoutButton.backgroundColor = .darkPink
        logoutButton.layer.cornerRadius = 25 // Capsule shape
        logoutButton.layer.masksToBounds = true
        logoutButton.titleLabel?.font = .font(family: .poppins, sizeFamily: .semibold, size: 18)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.setTitleColor(.white, for: .normal)
        
        self.view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            logoutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Back Button Action
    
    @objc func backButtonTapped() {
        debugPrint("Back button tapped!")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Logout Button Action
    @objc func logoutButtonTapped() {
        debugPrint("LogOut button tapped!")
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Switch Action
    
    @objc func switchToggled(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is ON")
        } else {
            print("Switch is OFF")
        }
        
        if let cell = sender.superview?.superview as? ProfileTableViewCell {
            let indexPath = tableView.indexPath(for: cell)
            debugPrint("Switch toggled in row \(indexPath?.row ?? -1)")
        }
    }
}

extension ProfileVC: UITableViewDelegate,UITableViewDataSource {
    
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
        
        // Handle visibility of switch and back button
        if indexPath.row == 4 {
            cell.toggleSwitch.isHidden = false   // Show switch
            cell.backButton.isHidden = true      // Hide back button
        } else {
            cell.toggleSwitch.isHidden = true   // Hide switch
            cell.backButton.isHidden = false    // Show back button
        }
        return cell
    }
    
    // MARK: - TableView Delegate Methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}



