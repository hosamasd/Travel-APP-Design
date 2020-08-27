//
//  PostCardCollectionViewCell.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit


protocol PostActions {
    func didProfileTapped()
}

class PostCardCollectionViewCell: BaseCollectionCell {
    
    var delegate:PostActions?
      var data:Posts?{
          didSet{
              manageData()
          }
      }
    
lazy var profilePicture:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = CustomColors.appGray
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(profileSelected))
        tap.numberOfTapsRequired = 1
        img.addGestureRecognizer(tap)
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var userDetails:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = CustomColors.appBlack
        l.numberOfLines = 0
        return l
    }()
    
    let postImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = CustomColors.appGray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()
    
    let stackView:UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()
    
    //MARK:- Like View
    
    let likeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let likeBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "like"), for: .normal)
        return btn
    }()
    
    let likeLabel:UILabel = {
        let l = UILabel()
        l.text = "1.2k"
        l.font = UIFont(name: CustomFont.productSansRegular, size: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Comment View
    
    let commentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let commentBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "comment"), for: .normal)
        return btn
    }()
    
    let commentLabel:UILabel = {
        let l = UILabel()
        l.text = "43"
        l.font = UIFont(name: CustomFont.productSansRegular, size: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- More View
    
    let moreView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let moreBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "moreBtn"), for: .normal)
        return btn
    }()
    
    override func setupViews() {
    
        addSubViews(views: profilePicture,userDetails,postImage,stackView)
        
        stackView.addArrangedSubview(likeView)
        likeView.addSubview(likeBtn)
        likeView.addSubview(likeLabel)
        stackView.addArrangedSubview(commentView)
        commentView.addSubview(commentBtn)
        commentView.addSubview(commentLabel)
        stackView.addArrangedSubview(moreView)
        moreView.addSubview(moreBtn)
        setUpConstraints()
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            profilePicture.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            profilePicture.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            profilePicture.widthAnchor.constraint(equalToConstant: 40),
            profilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            userDetails.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 15),
            userDetails.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            userDetails.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            
            postImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            postImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            postImage.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 15),
            
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.heightAnchor.constraint(equalToConstant: 30),
            stackView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            likeBtn.leadingAnchor.constraint(equalTo: likeView.leadingAnchor),
            likeBtn.widthAnchor.constraint(equalToConstant: 25),
            likeBtn.heightAnchor.constraint(equalToConstant: 25),
            likeBtn.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            
            likeLabel.leadingAnchor.constraint(equalTo: likeBtn.trailingAnchor,constant: 3),
            likeLabel.trailingAnchor.constraint(equalTo: likeView.trailingAnchor, constant: -3),
            likeLabel.centerYAnchor.constraint(equalTo: likeView.centerYAnchor),
            
            commentBtn.leadingAnchor.constraint(equalTo: commentView.leadingAnchor),
            commentBtn.widthAnchor.constraint(equalToConstant: 25),
            commentBtn.heightAnchor.constraint(equalToConstant: 25),
            commentBtn.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            
            commentLabel.leadingAnchor.constraint(equalTo: commentBtn.trailingAnchor,constant: 3),
            commentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -3),
            commentLabel.centerYAnchor.constraint(equalTo: commentView.centerYAnchor),
            
            moreBtn.trailingAnchor.constraint(equalTo: moreView.trailingAnchor),
            moreBtn.widthAnchor.constraint(equalToConstant: 25),
            moreBtn.heightAnchor.constraint(equalToConstant: 25),
            moreBtn.centerYAnchor.constraint(equalTo: moreView.centerYAnchor),
        ])
    }
    
    func manageData(){
        guard let data = data else {return}
        profilePicture.image = UIImage(named:data.profileImage)
        postImage.image = UIImage(named: data.postImage)
        likeLabel.text = data.likeCount
        commentLabel.text = data.commentCount
        setUpAttributedText()
    }
    
    func setUpAttributedText(){
        guard let data = data else {return}
        let attributedText = NSMutableAttributedString(string:"\(data.userName ?? "")\n" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
        attributedText.append(NSAttributedString(string: "\(data.time ?? "")" , attributes:
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: CustomColors.appGray]))
        userDetails.attributedText = attributedText
    }
    
    @objc func profileSelected(){
        delegate?.didProfileTapped()
    }
    
}

