//
//  GalleryTVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 07/12/24.
//

import UIKit

class GalleryTVC: UITableViewCell {
    
    private let categoryImageView = UIImageView()
    private let titleLabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       // Set  category image view
        setCategoryImageView()
        
    }
    
    //MARK: Set  category image view
    
    func setCategoryImageView() {
        
        titleLabel.textColor = .white
        titleLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.addSubview(titleLabel)
        
        categoryImageView.contentMode = .scaleAspectFill
        categoryImageView.clipsToBounds = true
        contentView.addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set up constraints for the imageView
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            categoryImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Configure method to load an image from URL
    func configure(imageUrl: String,title:String) {
        if let url = URL(string: imageUrl) {
            categoryImageView.load(url: url)
            titleLabel.text = title
        }
    }
}
