//
//  MyCollectionViewCell.swift
//  0624_collectionview_practice
//
//  Created by 손대홍 on 2021/06/25.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileLabel: UILabel!
    
    var imageName: String = "" {
        didSet{
            print("\(type(of: self)) / imageName - \(#function) : \(imageName)")
            
            // 셀 UI 설정
            self.profileImg.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("\(type(of: self)) - \(#function) called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
    }
}
