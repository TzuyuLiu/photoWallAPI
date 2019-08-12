//
//  SelectedPhotoViewController.swift
//  photoWall
//
//  Created by 劉子瑜 on 2019/8/12.
//  Copyright © 2019 劉子瑜. All rights reserved.
//

import UIKit

class SelectedPhotoViewController: UIViewController {

    @IBOutlet weak var ShowImageView: UIImageView!
    var selectedPhotoIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let selectedPhotoIndex = selectedPhotoIndex{
            print("pic\(selectedPhotoIndex.self)以傳送到SlsectPhotoViewController")
            
            ShowImageView.image = UIImage(named: "pic\(selectedPhotoIndex)")
        } else{
            print("沒取得照片")
        }
        
    }
    
}
