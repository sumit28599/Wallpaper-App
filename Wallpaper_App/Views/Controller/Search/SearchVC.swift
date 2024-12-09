//
//  SearchVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 08/12/24.
//

import UIKit

class SearchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .app
        
        // Set Search container view
        searchContainer()
    }
    
    class func instanciate() -> SearchVC {
        let vc = SearchVC()
        return vc
    }
    
    //MARK:  Set Search container view
    func searchContainer() {
        let searchContainer = UIView()
        searchContainer.backgroundColor = UIColor.white
        searchContainer.layer.cornerRadius = 20
        searchContainer.layer.masksToBounds = true
        searchContainer.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.layer.borderWidth = 1
        searchContainer.layer.borderColor = UIColor.lightGray.cgColor
        view.addSubview(searchContainer)
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(systemName: "magnifyingglass")
        searchIcon.tintColor = .gray
        searchIcon.contentMode = .scaleAspectFit
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(searchIcon)
        
        // Create the search text field
        let searchTextField = UITextField()
        searchTextField.placeholder = "Search images..."
        searchTextField.borderStyle = .none
        searchTextField.font = UIFont.systemFont(ofSize: 16)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchContainer.addSubview(searchTextField)
        
        // Layout constraints
        NSLayoutConstraint.activate([
            searchContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchContainer.heightAnchor.constraint(equalToConstant: 40),
            searchContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Search icon constraints
            searchIcon.leadingAnchor.constraint(equalTo: searchContainer.leadingAnchor, constant: 10),
            searchIcon.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            // Search text field constraints
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: searchContainer.trailingAnchor, constant: -10),
            searchTextField.centerYAnchor.constraint(equalTo: searchContainer.centerYAnchor),
            searchTextField.heightAnchor.constraint(equalTo: searchContainer.heightAnchor)
        ])
    }

}

