//
//  MyCustomCollectionViewCell.swift
//  0624_collectionview_practice
//
//  Created by 손대홍 on 2021/06/25.
//

import Foundation
import UIKit

class MyCustomCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    var imageName: String = "" {
        didSet{
            print("\(type(of: self)) / imageName - didSet() : \(imageName)")
            
            // 셀 UI 설정
            self.profileImg.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\(type(of: self)) - \(#function) called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    }
}
