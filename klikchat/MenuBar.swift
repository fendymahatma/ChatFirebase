//
//  MenuBar.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/31/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    let imageName = ["account-multiple", "comment-processing-outline", "clock", "dots-horizontal"]
    
    
    lazy var colectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set colelction view nya
        colectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(colectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: colectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: colectionView)
        
        
        setupHorizontalBar()
        
    }
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.white
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(horizontalBarView)
        
        // ambil valuenya biar bisa samakan dengan scroll view horizontal yang di bawah
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/4).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * frame.width / 4
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 0.75) { 
            self.layoutIfNeeded()
        }
    }
    
    // set berapa totalnya
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // set isi coll nya
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.imageView.image = UIImage(named: imageName[indexPath.item])?.withRenderingMode(.alwaysTemplate)
        cell.tintColor = UIColor(r: 31, g: 135, b: 73)
        
        // set yang ke highlite dluan sapa saat buka app
        collectionView.selectItem(at: IndexPath(item:0, section:0), animated: false, scrollPosition:[])
        return cell
    }
    
    // set tinggi dan lebar
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    
    // hapus space nya
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // biar ga error aja,,, wkwkwkwkkw
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

