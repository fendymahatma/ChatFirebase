//
//  MainController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/31/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class CoreController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    let menuBar:MenuBar = {
        let mb = MenuBar()
        mb.translatesAutoresizingMaskIntoConstraints = false
        return mb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar()
        setupMenuBar()
        setupCollectionView()
        
    }
    
    // Set NavigationBar
    private func setupNavigationBar() {
        let titleNavigationBar = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleNavigationBar.text = "Timeline"
        titleNavigationBar.textColor = UIColor.white
        navigationItem.titleView = titleNavigationBar
        navigationController?.navigationBar.isTranslucent = false
    }
    
    // Set MenuBar
    private func setupMenuBar(){
        // nyembunyiin navigasi bar
        navigationController?.hidesBarsOnSwipe = true
        
        // Biar ga lubang
        let greenView = UIView()
        greenView.backgroundColor = UIColor(r: 37, g: 163, b: 103)
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: greenView)
        view.addConstraintsWithFormat(format: "V:[v0(40)]", views: greenView)
        
        // tampilkan menu bar
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:[v0(40)]", views: menuBar)
        
        // biar berhenti di atas view (nge pin)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    
    // Set CollectionView per page
    func setupCollectionView() {
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.contentInset = UIEdgeInsetsMake(37, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(37, 0, 0, 0)
        collectionView?.isPagingEnabled = true
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
    
    // Set Total Celll
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // Set isi Cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        let bgcollors: [UIColor] = [.red, .blue, .purple, .green]
        cell.backgroundColor = bgcollors[indexPath.item]
        
        return cell
    }
    
    // Set Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
}
