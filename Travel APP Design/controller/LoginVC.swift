//
//  ViewController.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    lazy var heroImage:UIImageView = {
           let img = UIImageView(image: UIImage(named: "img1"))
           img.translatesAutoresizingMaskIntoConstraints = false
           img.contentMode = .scaleAspectFill
           img.clipsToBounds = true
        img.constrainHeight(constant: view.frame.height/2)
           return img
       }()
       
       lazy var appLogo = UILabel(text: "Travelers", font: UIFont(name: CustomFont.logoFont, size: 45), textColor: .white)
       
       lazy var loginBtn:UIButton = {
           let btn = UIButton()
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.setTitle("Login", for: .normal)
           btn.setTitleColor(CustomColors.appBlack, for: .normal)
           btn.titleLabel?.font = UIFont(name: CustomFont.productSansRegular, size: 16)
           btn.layer.cornerRadius = 35
           btn.layer.borderColor = CustomColors.appPurple.cgColor
           btn.layer.borderWidth = 1.6
           btn.backgroundColor = .white
           btn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
           //shadow
           btn.layer.shadowColor = UIColor.lightGray.cgColor
           btn.layer.shadowOffset = CGSize(width: 0, height: 2)
           btn.layer.shadowRadius = 10
           btn.layer.shadowOpacity = 0.3
        btn.constrainHeight(constant: 70)
           return btn
       }()
       
       lazy var createNewAccount:UIButton = {
           let btn = UIButton()
           btn.translatesAutoresizingMaskIntoConstraints = false
           btn.setTitle("Create new account", for: .normal)
           btn.setTitleColor(.white, for: .normal)
           btn.titleLabel?.font = UIFont(name: CustomFont.productSansRegular, size: 16)
           btn.layer.cornerRadius = 35
           btn.backgroundColor = CustomColors.appPurple
        btn.constrainHeight(constant: 70)

           return btn
       }()
       
       lazy var signingUpLabel:UILabel = {
           let l = UILabel()
           l.textColor = CustomColors.appBlack
           l.translatesAutoresizingMaskIntoConstraints = false
        let attributedText = NSMutableAttributedString(string:"By Signing up, you agree to the" , attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)])
           attributedText.append(NSAttributedString(string: " Term of use & privacy policy." , attributes:
               [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: CustomColors.appPurple]))
           l.attributedText = attributedText
        l.numberOfLines = 0

//           l.textAlignment = .center
//        l.constrainWidth(constant: 260)
           return l
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
setupViews()
    }
    
    func setupViews()  {
                view.backgroundColor = .white
        view.addSubViews(views: heroImage,appLogo,loginBtn,createNewAccount,signingUpLabel)
        
        heroImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        appLogo.anchor(top: heroImage.bottomAnchor, leading: nil, bottom: nil, trailing: nil)
        
        loginBtn.anchor(top: nil, leading: view.leadingAnchor, bottom: createNewAccount.topAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 35, bottom: 20, right: 35))
        createNewAccount.anchor(top: nil, leading: view.leadingAnchor, bottom: signingUpLabel.topAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 35, bottom: 15, right: 35))
        signingUpLabel.anchor(top: nil, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor,padding: .init(top: 0, left: 35, bottom: 30, right: 35))

        NSLayoutConstraint.activate([
                  appLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  createNewAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                  
//                  signingUpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              ])
    }
    
    
    @objc func loginBtnPressed(){
//           let VC = HomeViewController()
//           let navVC = UINavigationController(rootViewController: VC)
//           navVC.modalPresentationStyle = .fullScreen
//           present(navVC, animated: true, completion: nil)
       }


}

