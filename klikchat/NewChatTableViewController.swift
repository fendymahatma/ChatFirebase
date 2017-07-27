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
        
        // Bikin navigasi bar kiri untuk cancel
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action:    #selector(handleCancel))
        
        // Nampilin table view pake sub class yang di buat jadi bisa edit sendiri
        tableView.register(UserCell.self, forCellReuseIdentifier: cellId)
        
        // jalanin fungsi ambil data
        fetchuser()
        
    }
    
    // Dapetin data dar Firebase
    func fetchuser() {
        
        FIRDatabase.database().reference().child("user").observe(.childAdded, with: {(snapshot) in
            
            // Masukkin data ke kelas
            if let dictionary = snapshot.value as? [String: AnyObject] {
                let user = User()
                user.setValuesForKeys(dictionary)
                self.users.append(user)
            }
            
            // Reload tampilan tableview kosong dengan yang ada datanya
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }, withCancel: nil)
        
        
    }
    
    // Handle button cancel
    func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
    
    // Set total cell / row
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    // Set isi cell / row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Nampilkan cell di table view yang dibuat dari sub class
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        // Tentukan yang di tampilkan di tiap cell
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.textLabel?.text = user.email
        
        return cell
    }

}

// subclass yang dibuat untuk set tampilan table viewnya aja
class UserCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
