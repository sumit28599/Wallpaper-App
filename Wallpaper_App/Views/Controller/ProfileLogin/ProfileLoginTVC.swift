//
//  ProfileLoginTVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import UIKit

class ProfileLoginTVC: UITableViewCell {
    
     var profileImageContainerView: UIView!
     var profileImageView: UIImageView!
     var titleLabel: UILabel!
     var backButton: UIButton!
     var toggleSwitch: UISwitch!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //Set all ui
        setAllUI()
    }
    
    //MARK: Set all UI
    func setAllUI() {
        profileImageContainerView = UIView()
        profileImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        profileImageContainerView.layer.cornerRadius = 16
        profileImageContainerView.layer.masksToBounds = true
        profileImageContainerView.backgroundColor = .darkPink
        addSubview(profileImageContainerView)
        
        // Initialize and configure profile image view
        profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageContainerView.addSubview(profileImageView)
        
        // Initialize and configure title label
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = .white
        addSubview(titleLabel)
        
        // Initialize and configure back button
        backButton = UIButton(type: .system)
        backButton.tintColor = .white
        backButton.translatesAutoresizingMaskIntoConstraints = false
        if let image = UIImage(named: "back_arrow") {
            backButton.setImage(image, for: .normal)
        }
        backButton.imageView?.contentMode = .scaleAspectFit
        addSubview(backButton)
        
        // Initialize and configure switch button
        
        
        toggleSwitch = UISwitch()
        toggleSwitch.translatesAutoresizingMaskIntoConstraints = false
        toggleSwitch.onTintColor = .white        // Set the color of the "on" portion to red
        toggleSwitch.thumbTintColor = .darkPink  // Set the thumb color to white (optional)
        toggleSwitch.isOn = true
        addSubview(toggleSwitch)
        
        // Set up constraints for profileImageContainerView, profileImageView, titleLabel, and backButton
        NSLayoutConstraint.activate([
            // Profile Image Container Constraints (circular)
            profileImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profileImageContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageContainerView.widthAnchor.constraint(equalToConstant: 35),
            profileImageContainerView.heightAnchor.constraint(equalToConstant: 35),
            
            // Profile Image View Constraints inside container (fill the container)
            profileImageView.leadingAnchor.constraint(equalTo: profileImageContainerView.leadingAnchor,constant: -5),
            profileImageView.trailingAnchor.constraint(equalTo: profileImageContainerView.trailingAnchor,constant: 5),
            profileImageView.topAnchor.constraint(equalTo: profileImageContainerView.topAnchor,constant: 5),
            profileImageView.bottomAnchor.constraint(equalTo: profileImageContainerView.bottomAnchor,constant: -5),
            
            // Title Label Constraints
            titleLabel.leadingAnchor.constraint(equalTo: profileImageContainerView.trailingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // Back Button Constraints
            backButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            
            // Switch Button Constraints
            toggleSwitch.trailingAnchor.constraint(equalTo: backButton.leadingAnchor),
            toggleSwitch.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
