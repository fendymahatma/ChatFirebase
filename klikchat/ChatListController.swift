//
//  ViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/25/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit
import Firebase

class ChatListController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kasih tombol di nafigasi kiri dan set action
        //let imageProfile = UIImage(named: "default_profile_pic")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(handleLogout))
        
        // Kasih tombol di nafigasi kanan dan set action
        let image = UIImage(named: "comment-plus-outline")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
    }
    
    //kalo user masih belum login
    override func didMove(toParentViewController parent: UIViewController?) {
        checkIfUserAreLogedIn()
    }
    
    func checkIfUserAreLogedIn() {
        let uid = FIRAuth.auth()?.currentUser?.uid
        
        if uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        } else {
            FIRDatabase.database().reference().child("user").child(uid!).observeSingleEvent(of: .value, with: { (data) in
                
                if let user = data.value as? [String: AnyObject] {
                    self.navigationItem.title = user["name"] as? String
                }
                
            }, withCancel: nil)
        }
    }
    
    // Fungsi untuk hanle tombol yang di buat di nafigasi
    func handleLogout() {
        
        do {
            try FIRAuth.auth()?.signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        let loginViewController = LoginController()
        present(loginViewController, animated: true, completion: nil)
    }
    
    func handleNewMessage() {
        // harus di set dulu viewnya untuk di kasih navigasi bar
        let newChatTableViewController = UITableViewController()
        let navController = UINavigationController(rootViewController: newChatTableViewController)
        present(navController, animated: true, completion: nil)
        
    }


}

