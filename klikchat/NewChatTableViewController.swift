//
//  NewChatTableViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/27/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit
import Firebase

class NewChatTableViewController: UITableViewController {

    let cellId = "cellId"
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:    #selector(handleCancel))
        
        fetchuser()
        
    }
    
    func fetchuser() {
        
        FIRDatabase.database().reference().child("user").observe(.childAdded, with: {(snapshot) in
            
            // Dapet data
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                user.setValuesForKeys(dictionary)
                self.users.append(user)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
                
        }, withCancel: nil)
        
        
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        
        return cell
    }

}
