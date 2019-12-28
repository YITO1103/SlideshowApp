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

        
        //var detailImageSize = detailImage?.size
        //let w = detailImage?.size.widt
        //let h : Double = Double( detailImage detailImageView!.size.width)
        //let h : Double =  detailImage?.size.height
        //let rect:CGRect = CGRect(x:0, y:0, width: w, height:h)
        //detailImageView.frame = rect
        //print("W,H)= (" +  + ","   + h + ")")

        //let h = Double( scrollView.frame.height)

            
        //}
        /*
        let rect:CGRect = CGRect(x:0, y:0, width:199, height:1000)
        detailImageView.frame = rect
        //detailImageView.image = self.detailImage

        
                       let reSize = CGSize(width: 500, height: 1000)
                */
                // UIImage インスタンスの生成
        let arr = sImagePath.components(separatedBy: "/")  // ;で分割する
        labelFileName.text = arr[arr.count-1]
        let img = UIImage(named:sImagePath)!
        //detailImageView.image = resize(image: img, dh: h)

        //detailImageView.image = resize(image: img, dh: h)
        
        // 枠
        detailImageView.layer.borderColor = UIColor.blue.cgColor
        detailImageView.layer.borderWidth = 1
        detailImageView.image = img
    }
    var sImagePath:String = ""
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var  detailImage : UIImage?
    
    func initUi() {
        print("initUi()----------------------")
    }
}
