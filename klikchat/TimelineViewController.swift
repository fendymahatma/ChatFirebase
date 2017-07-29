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
        
        // Set navigation bar
        let titleNavigationBar = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleNavigationBar.text = "Timeline"
        titleNavigationBar.textColor = UIColor.white
        navigationItem.titleView = titleNavigationBar
        navigationController?.navigationBar.isTranslucent = false
        
        // Set collectionView
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(TimelineCell.self, forCellWithReuseIdentifier: "cellid")
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

