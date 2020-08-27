//
//  HomeHeaderView.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class HomeHeaderView: UIView {
    
  let user:[String] = ["user-img2", "user-img2", "user-img2", "user-img2", "user-img2", "user-img2", "user-img2"]
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        cv.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "StoryCollectionViewCell")
        cv.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        cv.delegate = self
        cv.dataSource = self
        cv.constrainHeight(constant: 80)
        return cv
    }()
    
    lazy var shareTextView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.borderWidth = 1.5
        v.layer.borderColor = CustomColors.appGray.cgColor
        v.layer.cornerRadius = 35
        return v
    }()
    
    lazy var shareLabel:UILabel = {
        let l = UILabel(text: "Share your memories..", font: UIFont.systemFont(ofSize: 16), textColor: CustomColors.appGray)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var btn1:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "img2"), for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    lazy var btn2:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "img3"), for: .normal)
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        addSubViews(views: collectionView,shareTextView)
        shareTextView.addSubViews(views: shareLabel,btn1,btn2)
        
        collectionView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            shareTextView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            shareTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            shareTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            shareTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            shareLabel.leadingAnchor.constraint(equalTo: shareTextView.leadingAnchor, constant: 25),
            shareLabel.centerYAnchor.constraint(equalTo: shareTextView.centerYAnchor),
            
            btn1.trailingAnchor.constraint(equalTo: shareTextView.trailingAnchor, constant: -20),
            btn1.centerYAnchor.constraint(equalTo: shareTextView.centerYAnchor),
            btn1.widthAnchor.constraint(equalToConstant: 40),
            btn1.heightAnchor.constraint(equalToConstant: 40),
            
            btn2.trailingAnchor.constraint(equalTo: btn1.leadingAnchor, constant: -10),
            btn2.centerYAnchor.constraint(equalTo: shareTextView.centerYAnchor),
            btn2.widthAnchor.constraint(equalToConstant: 40),
            btn2.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeHeaderView:UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as! StoryCollectionViewCell
        cell.imageView.image = UIImage(named: user[indexPath.row])
        if indexPath.row > 0{
            cell.backview.layer.borderWidth = 1.5
            cell.addButton.isHidden = true
        } else {
            cell.backview.layer.borderWidth = 0
            cell.addButton.isHidden = false
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65, height: 65)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}


