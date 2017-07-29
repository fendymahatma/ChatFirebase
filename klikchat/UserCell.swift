//
//  UserCellTableViewController.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/29/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

// subclass yang dibuat untuk set tampilan table viewnya aja
class UserCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
