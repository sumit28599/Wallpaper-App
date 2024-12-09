//
//  GalleryCVC.swift
//  Wallpaper_App
//
//  Created by BigOh on 06/12/24.
//

import UIKit

class GalleryCVC: UICollectionViewCell {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
    }
    
    //MARK: Set image view
    func setImageView() {
        
        titleLabel.textColor = .white
        titleLabel.font = .font(family: .poppins, sizeFamily: .semibold, size: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleLabel)
        
        
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 5),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(imageUrl: String,title: String) {
        if let url = URL(string: imageUrl) {
            imageView.load(url: url)
            titleLabel.text = title
        }
    }
}
