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
        img.constrainWidth(constant: 40)
        img.constrainHeight(constant: 40)
        return img
    }()
    
    lazy var userDetails:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = CustomColors.appBlack
        l.numberOfLines = 0
        return l
    }()
    
    lazy var postImage:UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.backgroundColor = CustomColors.appGray
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 5
        return img
    }()
    
    lazy var stackView:UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .horizontal
        return sv
    }()
    
    //MARK:- Like View
    
    lazy var likeView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var likeBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "like"), for: .normal)
        btn.constrainWidth(constant: 25)
        btn.constrainHeight(constant: 25)
        return btn
    }()
    
    lazy var likeLabel:UILabel = {
        let l = UILabel()
        l.text = "1.2k"
        l.font = UIFont(name: CustomFont.productSansRegular, size: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- Comment View
    
    lazy var commentView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var commentBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "comment"), for: .normal)
        btn.constrainWidth(constant: 25)
        btn.constrainHeight(constant: 25)
        return btn
    }()
    
    lazy var commentLabel:UILabel = {
        let l = UILabel()
        l.text = "43"
        l.font = UIFont(name: CustomFont.productSansRegular, size: 14)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    //MARK:- More View
    
    lazy var moreView:UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var moreBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "moreBtn"), for: .normal)
        btn.constrainWidth(constant: 25)
        btn.constrainHeight(constant: 25)
        return btn
    }()
    lazy var likeStack = getStackkks(vv: likeBtn, v: likeLabel)
    lazy var commentStack = getStackkks(vv: commentBtn, v: commentLabel)
    
    override func setupViews() {
        let topSTack = getStack(views: profilePicture,userDetails,UIView(), spacing: 8, distribution: .fill, axis: .horizontal)
        let bottomStack = getStack(views: likeStack,commentStack,UIView(),moreBtn, spacing: 8, distribution: .fill, axis: .horizontal)
        
        addSubViews(views: topSTack,postImage,bottomStack)
        topSTack.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor,padding: .init(top: 15, left: 15, bottom: 0, right: 15))
        postImage.anchor(top: topSTack.bottomAnchor, leading: leadingAnchor, bottom: bottomStack.topAnchor, trailing: trailingAnchor,padding: .init(top: 15, left: 15, bottom: 16, right: 15))
        bottomStack.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 15, left: 15, bottom: 0, right: 15))
        
    }
    
    func getStackkks(vv:UIView,v:UIView) -> UIStackView {
        return getStack(views: vv,v, spacing: 2, distribution: .fill, axis: .horizontal)
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

