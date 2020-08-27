//
//  HomeVC.swift
//  Travel APP Design
//
//  Created by hosam on 8/27/20.
//  Copyright © 2020 hosam. All rights reserved.
//

import UIKit

struct Posts {
    let postImage:String!
    let imageHeight:Int!
    let imageWidth:Int!
    let profileImage:String!
    let userName:String!
    let time:String!
    let likeCount:String!
    let commentCount:String!
}

class HomeVC: UIViewController {
    
    var posts:[Posts] = [
        Posts(postImage: "post-img2", imageHeight: 4912, imageWidth: 7360, profileImage: "user-img2", userName: "Mo Chun", time: "2 min ago", likeCount: "932", commentCount: "20"),
        Posts(postImage: "post-img2", imageHeight: 2963, imageWidth:4608, profileImage: "user-img2", userName: "Lisa", time: "10 min ago", likeCount: "1.2k", commentCount: "48"),
        Posts(postImage: "post-img2", imageHeight: 3840, imageWidth:2571, profileImage: "user-img2", userName: "Samuel", time: "12 min ago", likeCount: "1.0k", commentCount: "32"),
        Posts(postImage: "post-img2", imageHeight: 3850, imageWidth: 2166, profileImage: "user-img2", userName: "Ashish", time: "22 min ago", likeCount: "932", commentCount: "20"),
        Posts(postImage: "post-img2", imageHeight: 3264, imageWidth:2448, profileImage: "user-img2", userName: "Sammy", time: "1 hour ago", likeCount: "2.2k", commentCount: "88"),
        Posts(postImage: "post-img2", imageHeight: 3840, imageWidth:2571, profileImage: "user-img2", userName: "Jordan", time: "3 hour ago", likeCount: "3.2k", commentCount: "132"),
        Posts(postImage: "post-img2", imageHeight: 3264, imageWidth:2448, profileImage: "user-img2", userName: "Dheeraj_ks", time: "4 hour ago", likeCount: "1.7k", commentCount: "32"),
    ]
    
    lazy var headerView:HomeHeaderView = {
        let v = HomeHeaderView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.constrainHeight(constant: 160)
        return v
    }()
    
    lazy var collectionView:UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: PinterestCustomLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .clear
        cv.setCollectionViewLayout(layout, animated: false)
        let customLayout = PinterestCustomLayout()
        cv.collectionViewLayout = customLayout
        cv.register(PostCardCollectionViewCell.self, forCellWithReuseIdentifier: "PostCardCollectionViewCell")
        cv.contentInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setUpNavigationBar()
    }
    
    func setupViews()  {
        
        view.backgroundColor = .white
        view.addSubViews(views: headerView,collectionView)
        
        headerView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor)
        collectionView.anchor(top: headerView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        ///Assigning Custom layout
        if let layout = collectionView.collectionViewLayout as? PinterestCustomLayout {
            layout.delegate = self
        }
    }
    
    func setUpNavigationBar(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel()
        titleLabel.text = "Travelers"
        titleLabel.textColor = CustomColors.appBlack
        titleLabel.font = UIFont(name: CustomFont.logoFont, size: 33)
        titleLabel.sizeToFit()
        
        let leftItem = UIBarButtonItem(customView: titleLabel)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(UIImage(named: "search"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 20)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.customView = searchButton
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }
    
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCardCollectionViewCell", for: indexPath) as! PostCardCollectionViewCell
        cell.delegate = self
        cell.data = posts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSize = (collectionView.frame.width - 3) / 2
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}

extension HomeVC: PinterestLayoutDelegate , PostActions {
    
    func didProfileTapped() {
        let VC = ProfileViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        let cellWidth = (collectionView.frame.width - 44) / 2
        let imageRatio = CGFloat(posts[indexPath.row].imageWidth) / CGFloat(posts[indexPath.row].imageHeight)
        return CGFloat(cellWidth / imageRatio) + 125.0
    }
}

