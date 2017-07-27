//
//  NewChatTableViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/27/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

class NewChatTableViewController: UITableViewController {

    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:    #selector(handleCancel))
        
    }
    
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        
        cell.textLabel?.text = "doremi"
        
        return cell
    }

}
