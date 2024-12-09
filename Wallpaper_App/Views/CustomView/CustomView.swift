//
//  CustomView.swift
//  Wallpaper_App
//
//  Created by BigOh on 04/12/24.
//

import UIKit

class CustomView: UIView {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "splash")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.font = .font(family: .poppins, sizeFamily: .semibold, size: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
  
    private func setupView() {
        addSubview(headerView)
        
        headerView.addSubview(imageView)
        headerView.addSubview(headerTitle)
        
        NSLayoutConstraint.activate([
            headerView.widthAnchor.constraint(equalToConstant: 190),
            headerView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        // Set up constraints for the imageView (top)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: headerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 180) // Adjust this value for your desired image size
        ])
        
        // Set up constraints for the headerTitle (bottom)
        NSLayoutConstraint.activate([
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            headerTitle.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // Dynamic method to set the title
    func setTitle(_ title: String) {
        headerTitle.text = title
    }
}
