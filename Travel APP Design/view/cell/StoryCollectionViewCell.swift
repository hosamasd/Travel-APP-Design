//
//  StoryCollectionViewCell.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class StoryCollectionViewCell: BaseCollectionCell {
    
    
    lazy var backview:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderColor = CustomColors.appPurple.cgColor
        v.layer.borderWidth = 1.5
        v.backgroundColor = .white
        v.layer.cornerRadius = 32.5
        return v
    }()
    
    lazy var imageView:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = .lightGray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 29.75
        return img
    }()
    
    lazy var addButton:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.setImage(UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.imageView?.tintColor = .lightGray
        //Set Shadow
        btn.layer.shadowColor = UIColor.lightGray.cgColor
        btn.layer.shadowOpacity = 0.1
        btn.layer.shadowOffset =  CGSize(width: -1, height: 1)
        btn.layer.shadowRadius = 5
        btn.layer.shouldRasterize = true
        btn.layer.masksToBounds = false
        btn.layer.rasterizationScale = UIScreen.main.scale
        btn.constrainWidth(constant: 30)
        btn.constrainHeight(constant: 30)
        return btn
    }()
    
    override func setupViews() {
        addSubViews(views: backview,addButton)
        backview.fillSuperview()
        backview.addSubview(imageView)
        
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 4, left: 4, bottom: 4, right: 4))
        addButton.anchor(top: nil, leading: nil, bottom: bottomAnchor, trailing: trailingAnchor)

    }
    
}

