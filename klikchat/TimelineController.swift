//
//  TimelineViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/28/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class TimelineController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavigationBar()
        
    }
    
    func setupCollectionView() {
        // Set collectionView
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(TimelineCell.self, forCellWithReuseIdentifier: "cellid")
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    }
    
    func setupNavigationBar() {
        // Bikin button search
        let searchImage = UIImage(named: "magnify")?.withRenderingMode(.alwaysOriginal)
        let searchButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        // Bikin button addContact
        let addContactImage = UIImage(named: "account-multiple-plus")?.withRenderingMode(.alwaysOriginal)
        let addContactButtonItem = UIBarButtonItem(image: addContactImage, style: .plain, target: self, action: #selector(handleAddContact))
        
        navigationItem.rightBarButtonItems = [addContactButtonItem, searchButtonItem]
    }
    
    func handleSearch() {
        print("search clicked")
    }
    
    func handleAddContact() {
        print("addContact clicked")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellid", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // mencari tinggi dan lebar gambar sebenarnya...
        
        let height = (view.frame.width - 16 - 16) * 9 / 16
        
        return CGSize(width: view.frame.width, height: 104 + height + 66)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}



