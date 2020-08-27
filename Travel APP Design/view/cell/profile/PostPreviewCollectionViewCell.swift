//
//  ProfileHeaderCollectionReusableView.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class PostPreviewCollectionViewCell: BaseCollectionCell {
    
    lazy var imagePreview:UIImageView = {
          let img = UIImageView()
          img.translatesAutoresizingMaskIntoConstraints = false
          img.contentMode = .scaleAspectFill
          img.layer.cornerRadius = 5
          img.clipsToBounds = true
          return img
      }()
      
    
    override func setupViews() {
         addSubview(imagePreview)
        
        imagePreview.fillSuperview(padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
}
