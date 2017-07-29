//
//  Extensions.swift
//  klikchat
//
//  Created by kliklabs indo kreasi on 7/29/17.
//  Copyright © 2017 kliklabs. All rights reserved.
//

import UIKit

// bikin extension biar ga ribet bikin constraintnya
extension UIView {
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
    }
}

// Bikin extension biar kalo nulis UIColor ga perlu (red: r/255, green: g/255, blue: b/255, alpha: 1)
extension UIColor{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
