//
//  MyCollectionVC.swift
//  0624_collectionview_practice
//
//  Created by 손대홍 on 2021/06/25.
//

import Foundation
import UIKit

class MyCollectionVC: UIViewController {
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var mySegmentControl: UISegmentedControl!
    fileprivate let systemImageNames = [
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise",
        "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise",
        "ant", "car", "airplane", "bandage", "waveform.path.ecg", "staroflife", "signature", "bag", "cart", "creditcard", "clock"
    ]
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(type(of: self)) - \(#function) called")
        
        // 콜렉션 뷰 설정
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        
        // 사용할 콜렉션뷰 셀 등록
        let myCustomCollectionViewCellNib = UINib(nibName: String(describing: MyCustomCollectionViewCell.self), bundle: nil)
        
        self.myCollectionView.register(myCustomCollectionViewCellNib, forCellWithReuseIdentifier: String(describing: MyCustomCollectionViewCell.self))
    }
}

// 콜렉션뷰 데이터소스 - 데이터 관련
extension MyCollectionVC: UICollectionViewDataSource {
    // 섹션에 들어가는 아이템 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNames.count
    }
    
    // 콜렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: MyCustomCollectionViewCell.self)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCustomCollectionViewCell
        
//        let cellId = String(describing: MyCollectionViewCell.self)
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        
        cell.imageName = self.systemImageNames[indexPath.item]

//        cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        cell.contentView.layer.cornerRadius = 10
//        cell.contentView.layer.borderWidth = 1
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
//        // 이미지 설정
//        cell.profileImg.image = UIImage(systemName: self.systemImageNames[indexPath.item])
//        // 라벨 텍스트 설정
//        cell.profileLabel.text = self.systemImageNames[indexPath.item]
        
        return cell
    }
    
    
}

// 콜렉션뷰 델리겟 - 액션 관련
extension MyCollectionVC: UICollectionViewDelegate {
    
}


