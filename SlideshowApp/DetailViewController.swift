//
//  DetailViewController.swift
//  SlideshowApp
//
//  Created by user1 on 2019/12/26.
//  Copyright © 2019 yutaka.ito4. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!

    @IBOutlet weak var labelFileName: UILabel!
    
    
    
    func resize(image: UIImage, dh: Double) -> UIImage {
            
        // オリジナル画像のサイズからアスペクト比を計算
        let aspectScale = image.size.width / image.size.height
        // widthからアスペクト比を元にリサイズ後のサイズを取得
        let resizedSize = CGSize(width: dh, height: dh * Double(aspectScale))
        // リサイズ後のUIImageを生成して返却
        UIGraphicsBeginImageContext(resizedSize)
        image.draw(in: CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    override func viewDidLayoutSubviews() {
    }
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
                // UIImage インスタンスの生成
        let arr = sImagePath.components(separatedBy: "/")  // ;で分割する
        labelFileName.text = arr[arr.count-1]
        let img = UIImage(named:sImagePath)!
        // 枠
        detailImageView.layer.borderColor = UIColor.blue.cgColor
        detailImageView.layer.borderWidth = 1
        detailImageView.image = img
    }
    var sImagePath:String = ""

    var  detailImage : UIImage?
    // 試しメソッド
    func initUi() {
        print("initUi()----------------------")
    }
}
