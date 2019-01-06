//
//  MenuBar.swift
//  YouTube App
//
//  Created by Алексей Пархоменко on 22/12/2018.
//  Copyright © 2018 Алексей Пархоменко. All rights reserved.
//

import UIKit

class MenuBar: UIView {

    lazy var menuBarCV = MenuBarCollectionView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = UIColor.YouTubeRed()
        translatesAutoresizingMaskIntoConstraints = false
        setupCollectioView()
        
    }
    
    func setupCollectioView() {
        addSubview(menuBarCV)
        
        // menuBarCV constraints
        menuBarCV.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
