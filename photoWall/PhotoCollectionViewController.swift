//
//  PhotoCollectionViewController.swift
//  photoWall
//
//  Created by 劉子瑜 on 2019/8/11.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class PhotoCollectionViewController: UICollectionViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        //設定cell的尺寸
        
        //希望一排有三張image，且每一張圖片都一樣大，圖片間隔為1
        let width = (collectionView.bounds.width - 1*2 ) / 3
        //希望一列(直的)有四張image，每張圖一樣大，間隔為1
        let height = (collectionView.bounds.height - 1*3) / 4
        
        //UICollectionViewController 的 property collectionViewLayout 型別為 UICollectionViewLayout，由於我們在 storyboard 將它設為 flow layout，因此我們可將它轉型為 UICollectionViewFlowLayout，然後設定它的 itemSize 控制 cell 的尺寸。
        let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout
        
        flowLayout?.itemSize = CGSize(width: width, height: height)
        
        //設定為0，cell的尺寸會依照itemSize調整
        flowLayout?.estimatedItemSize = .zero
    }

 
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 21
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoCollectionViewCell.self)", for: indexPath) as! PhotoCollectionViewCell
    
        // Configure the cell
        cell.photoImageView.image = UIImage(named: "pic\(indexPath.row)")
    
        return cell
    }
    
    //使用prepare傳遞資料到下一個顯示圖片的頁面
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let controller = segue.destination as? SelectedPhotoViewController
       let cell = sender as! UICollectionViewCell
       controller?.selectedPhotoIndex = self.collectionView!.indexPath(for: cell)?.row
        
        
    }
 
 

}
