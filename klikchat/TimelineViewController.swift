//
//  TimelineViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/28/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class TimelineViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(TimelineCell.self, forCellWithReuseIdentifier: "cellid")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

class TimelineCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    let separator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let thumbnailImageView: UIImageView = {
       let image = UIImageView()
        image.backgroundColor = UIColor.white
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.green
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let createdAtDate: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalReaction: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalCommentAndShare: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let reactionIcon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.purple
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let commentIcon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.orange
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let shareIcon: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.red
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
 
    func setupView() {
        backgroundColor = UIColor.gray
        //set semua tampilan
        addSubview(thumbnailImageView)
        addSubview(separator)
        addSubview(profileImageView)
        addSubview(userName)
        addSubview(createdAtDate)
        addSubview(totalReaction)
        addSubview(totalCommentAndShare)
        addSubview(bottomView)
        setupBottomView()
        
        // horizontal constraint setup
        addConstraintsWithFormat(format: "H:|-16-[v0(40)]", views: profileImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separator)
        addConstraintsWithFormat(format: "H:|-16-[v0(150)]", views: totalReaction)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: bottomView)
        
        // vertical constraint setup
        addConstraintsWithFormat(format: "V:|-16-[v0(40)]-[v1]-[v2(20)]-[v3(30)]-16-[v4(1)]|", views: profileImageView, thumbnailImageView, totalReaction, bottomView, separator)
        
        //========================================== createdAtDate
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .bottom, relatedBy: .equal, toItem: thumbnailImageView, attribute: .top, multiplier: 1, constant: -8))
        
        // letft constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // height constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // right constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        
        //========================================== userName
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .bottom, relatedBy: .equal, toItem: createdAtDate, attribute: .top, multiplier: 1, constant: -4))
        
        // letft constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // right constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // height constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        
        //========================================== totalCommentAndShare
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        // letft constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .left, relatedBy: .equal, toItem: totalReaction, attribute: .right, multiplier: 1, constant: 8))
        
        // right constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // height constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        
        
    }
    
    func setupBottomView() {
        bottomView.addSubview(reactionIcon)
        bottomView.addSubview(commentIcon)
        bottomView.addSubview(shareIcon)
        addConstraintsWithFormat(format: "H:|[v0(109)]-[v1(109)]-[v2(109)]|", views: reactionIcon, commentIcon, shareIcon)
        addConstraintsWithFormat(format: "V:|[v0]|", views: reactionIcon)
        addConstraintsWithFormat(format: "V:|[v0]|", views: commentIcon)
        addConstraintsWithFormat(format: "V:|[v0]|", views: shareIcon)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// bikin extension biar ga ribet bikin constraintnya
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}











