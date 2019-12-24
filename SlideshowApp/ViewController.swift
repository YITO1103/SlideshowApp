//
//  ViewController.swift
//  SlideshowApp
//
//  Created by user1 on 2019/12/23.
//  Copyright © 2019 yutaka.ito4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum CMD: String {
        case c_next = "次"
        case c_prev = "前"
        case c_init = "はじめ"
    }    //　指定
    func showImage(_ sCmd : CMD) {
        
        switch sCmd {
        case CMD.c_next:
            iCurrentIndex -= 1
            if iCurrentIndex < 0  {
                iCurrentIndex = arrPathImageFile.count - 1
            }
            break
        case CMD.c_prev:
            iCurrentIndex += 1
            if iCurrentIndex >= arrPathImageFile.count {
                iCurrentIndex = 0
            }
            break
        default:
            iCurrentIndex = 0
            break
        }
        print("prev iCurrentIndex>>" + iCurrentIndex.description + ":::" + arrPathImageFile[iCurrentIndex])
        print("----------------------")
        print( arrPathImageFile)
        print("----------------------")
        print( arrPathImageFile.count)
        print("prev iCurrentIndex>>" + iCurrentIndex.description + ":::" + arrPathImageFile[iCurrentIndex])
        // 画像ファイルを読み込み Image Viewに画像を設定
         
        imageView.image = nil
        imageView.setNeedsDisplay()
        imageView.image = UIImage(named: arrPathImageFile[iCurrentIndex])
     }

    //表示対象の画像のパスの配列
    var arrPathImageFile : [String] = []
    // 表示中のアイテムNo.
    var iCurrentIndex:Int=0

    // 進むをタップ
    @IBAction func btnNext(_ sender: Any) {
        showImage(CMD.c_next)
    }
    // 戻るをタップ
    @IBAction func btnPrev(_ sender: Any) {
        showImage(CMD.c_prev)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var sImgDirPath:String=""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //for deb
        print(NSHomeDirectory())
        
        // ファイル一覧を取得するためfileManagerをインスタンス
        let fileManager = FileManager()
         
        // ファイル一覧の場所であるpathを文字列で取得
        //let path = Bundle.main.bundlePath
        sImgDirPath = Bundle.main.bundlePath + "/images"

        do {
            let files = try fileManager.contentsOfDirectory(atPath: sImgDirPath)
         
            // png画像だけを集める配列を用意
            // todo: 画像形式。画像数
            
            for file in files {
                // ファイル名の後方が.pngであればtrueとなる
                if file.hasSuffix(".png") {
                    let sPath = sImgDirPath + "/" + file
                    arrPathImageFile.append(sPath)
                    //print(sPath)
                }
            }

            /*
            print("----------------------")
             print( arrPathImageFile)
            print("----------------------")
            print( arrPathImageFile.count)
            print("prev iCurrentIndex>>" + iCurrentIndex.description + ":::" + arrPathImageFile[iCurrentIndex])
            // 画像ファイルを読み込み Image Viewに画像を設定
            imageView.image = nil
            imageView.setNeedsDisplay()
            imageView.image = UIImage(named: arrPathImageFile[iCurrentIndex])
            */
        }
        catch let error {
            print("----------------------")

            print( error)
        }
        showImage(CMD.c_init)

        
        /*
        let sImgPath = sImgDirPath + "/01.png"       // バンドルした画像ファイルを読み込み
        let image = UIImage(named: sImgPath)
        // Image Viewに画像を設定
        imageView.image = image
         */
        
    }
}

