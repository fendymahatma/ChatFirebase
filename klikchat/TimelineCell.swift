//
//  TimelineCell.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/29/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class TimelineCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    let separatorCell: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let statusTextView: UITextView = {
        let textview = UITextView()
        textview.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard"
        textview.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        textview.font = .systemFont(ofSize: 12, weight: 0.01)
        textview.translatesAutoresizingMaskIntoConstraints = false
        return textview
    }()
    
    let thumbnailImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "that_was_easy")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profilepicture")
        image.layer.cornerRadius = 22
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let userName: UILabel = {
        let label = UILabel()
        label.text = "Intan Nurlaila"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let createdAtDate: UITextView = {
        let label = UITextView()
        label.text = "24 Jul 17 at 15:36"
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        label.textColor = UIColor.lightGray
        label.font = .systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalReaction: UITextView = {
        let label = UITextView()
        label.text = "0 reaction"
        label.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        label.textColor = UIColor.lightGray
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalCommentAndShare: UITextView = {
        let label = UITextView()
        label.text = "28 comment - 0 share"
        label.textContainerInset = UIEdgeInsetsMake(0, 0, 0, -4)
        label.textColor = UIColor.lightGray
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let separatorBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let reactionIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "emoticon")
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let commentIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "comment-outline")
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let shareIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "share-variant")
        image.contentMode = .center
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    func setupView() {
        backgroundColor = UIColor.white
        //set semua tampilan
        addSubview(profileImageView)
        addSubview(userName)
        addSubview(createdAtDate)
        addSubview(statusTextView)
        addSubview(thumbnailImageView)
        addSubview(totalReaction)
        addSubview(totalCommentAndShare)
        addSubview(separatorBottomView)
        addSubview(bottomView)
        setupBottomView()
        addSubview(separatorCell)
        
        // horizontal constraint setup
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: profileImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: statusTextView)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorCell)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorBottomView)
        addConstraintsWithFormat(format: "H:|-16-[v0(150)]", views: totalReaction)
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: bottomView)
        
        // vertical constraint setup
        addConstraintsWithFormat(format: "V:|-16-[v0(44)]-[v1(44)]-[v2]-2-[v3(10)]-[v4(2)]-[v5(20)]-[v6(7)]|", views: profileImageView, statusTextView, thumbnailImageView, totalReaction, separatorBottomView, bottomView, separatorCell)
        
        //========================================== createdAtDate
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .bottom, relatedBy: .equal, toItem: statusTextView, attribute: .top, multiplier: 1, constant: -20))
        // letft constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        // height constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .right, relatedBy: .equal, toItem: statusTextView, attribute: .right, multiplier: 1, constant: 0))
        // right constraint
        addConstraint(NSLayoutConstraint(item: createdAtDate, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 12))
        //========================================== userName
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .bottom, relatedBy: .equal, toItem: createdAtDate, attribute: .top, multiplier: 1, constant: -2))
        // letft constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .left, relatedBy: .equal, toItem: profileImageView, attribute: .right, multiplier: 1, constant: 8))
        // right constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .right, relatedBy: .equal, toItem: statusTextView, attribute: .right, multiplier: 1, constant: 0))
        // height constraint
        addConstraint(NSLayoutConstraint(item: userName, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 18))
        //========================================== totalCommentAndShare
        // bottom constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 2))
        // letft constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .left, relatedBy: .equal, toItem: totalReaction, attribute: .right, multiplier: 1, constant: 8))
        // right constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // height constraint
        addConstraint(NSLayoutConstraint(item: totalCommentAndShare, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 10))
        
        
        
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
