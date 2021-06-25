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
        
        // 콜렉션뷰 콜렉션뷰 레이아웃 설정
        self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        
    }
    @IBAction func onCollectionViewTypeChanged(_ sender: UISegmentedControl) {
        print("\(type(of: self)) - \(#function) called / sender.selectedSegmentIndex:  \(sender.selectedSegmentIndex)")
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        case 1:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForSecond()
        case 2:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForThird()
        default:
            self.myCollectionView.collectionViewLayout = createCompositionalLayoutForFirst()
        }
    }
}

//MARK: - 콜렉션뷰 컴포지셔널 레이아웃 설정
extension MyCollectionVC {
    fileprivate func createCompositionalLayoutForFirst() -> UICollectionViewLayout {
        // 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 아이템 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2))
            
            // 그룹 생성
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            
            // 그룹으로 섹션 생성
            let section = NSCollectionLayoutSection(group: group)
            
            // 섹션 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutForSecond() -> UICollectionViewLayout {
        // 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 아이템 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/2))
            
            // 그룹 생성
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            
            // 그룹으로 섹션 생성
            let section = NSCollectionLayoutSection(group: group)
            
            // 섹션 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
    }
    
    fileprivate func createCompositionalLayoutForThird() -> UICollectionViewLayout {
        // 레이아웃 생성
        let layout = UICollectionViewCompositionalLayout{
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            // 아이템 사이즈
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            
            // 아이템 생성
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // 아이템 간 간격
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            // 그룹 사이즈
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1/3))
            
            // 그룹 생성
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
            
            // 그룹으로 섹션 생성
            let section = NSCollectionLayoutSection(group: group)
            
            // 섹션 간격
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            
            return section
        }
        return layout
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


