//
//  CustomHeaderView.swift
//  Wallpaper_App
//
//  Created by BigOh on 09/12/24.
//

import UIKit

class CustomHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "CustomHeaderView"
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Header Title"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("See More", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        button.backgroundColor = .darkPink
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
            

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
        addSubview(seeMoreButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            seeMoreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            seeMoreButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    @objc func buttonTapped() {
        print("Button in header tapped")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
