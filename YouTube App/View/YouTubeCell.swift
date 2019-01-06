//
//  CollectionViewCell.swift
//  YouTube App
//
//  Created by Алексей Пархоменко on 22/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

class YouTubeCollectionViewCell: BaseCell {
    
    private var videoImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .green
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
   
    private var nameOfVideo: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.purple
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var nameOfProfile: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.gray.cgColor
        setupAutoLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupAutoLayout() {
        
        addSubview(profileImage)
        addSubview(nameOfVideo)
        addSubview(nameOfProfile)
        addSubview(videoImage)

        // profileImage constraints
        profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        profileImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
        profileImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // nameOfVideo constraints
        nameOfVideo.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8).isActive = true
        nameOfVideo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        nameOfVideo.topAnchor.constraint(equalTo: profileImage.topAnchor).isActive = true
        nameOfVideo.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 0.4).isActive = true
        
        // nameOfProfile constants
        nameOfProfile.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 8).isActive = true
        nameOfProfile.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        nameOfProfile.topAnchor.constraint(equalTo: nameOfVideo.bottomAnchor, constant: 4).isActive = true
        nameOfProfile.heightAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 0.5, constant: 6).isActive = true
        
        // videoImage constants
        videoImage.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        videoImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        videoImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        videoImage.bottomAnchor.constraint(equalTo: profileImage.topAnchor, constant: -8).isActive = true
    }
    
}
