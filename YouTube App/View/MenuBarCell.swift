//
//  MenuBarCell.swift
//  YouTube App
//
//  Created by Алексей Пархоменко on 22/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MenuBarCell: BaseCell {
    
    
    lazy var menuImageView: UIImageView = {
        let im = UIImageView()
        im.image = UIImage(named: "Jeff")?.withRenderingMode(.alwaysTemplate)
        im.translatesAutoresizingMaskIntoConstraints = false
        im.tintColor = UIColor.rgb(red: 91, green: 14, blue: 13)
        return im
        
    }()
    
    
    override var isSelected: Bool {
        didSet {
            menuImageView.tintColor = isSelected ? UIColor.white : UIColor.rgb(red: 91, green: 14, blue: 13)
        }
    }
    
    override func setupAutoLayout() {
        super.setupAutoLayout()
        
        addSubview(menuImageView)
        
        // menuImageView constraints
        menuImageView.centeredFillSuperview(size: CGSize(width: 28, height: 28))
        
        
        
    }
}
