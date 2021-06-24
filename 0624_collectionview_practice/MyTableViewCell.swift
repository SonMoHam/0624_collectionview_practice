//
//  MyTableViewCell.swift
//  0624_collectionview_practice
//
//  Created by 손대홍 on 2021/06/24.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userProfileImg: UIImageView!
    @IBOutlet weak var userContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("\(type(of: self)) - \(#function) called")
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
    }
}
