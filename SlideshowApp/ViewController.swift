//
//  ViewController.swift
//  SlideshowApp
//
//  Created by user1 on 2019/12/23.
//  Copyright © 2019 yutaka.ito4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func tapAction(_ sender: Any) {
        
        print("tapAction------")
        print("インデックス：" + iCurrentIndex.description)

        let urlPath = URL(fileURLWithPath: arrPathImageFile[iCurrentIndex])

        print("fullpath：" + urlPath.description)
        print("file：" + urlPath.lastPathComponent)
        
        
        // セグエを使用して画面を遷移
        self.performSegue(withIdentifier: "detail", sender: nil)    }
        //https://qiita.com/misakiagata/items/b7f6c2f6c9f988ec38c7
    // タイマー
    // timeInterval: 2sec, repeats: true
    @objc func updateTimer(_ timer: Timer) {

        if bAutoPlay {
            print("---updateTimer-------iCurrentIndex:" + iCurrentIndex.description)
            showImage(CMD.c_next)
        }
    }
    var timer: Timer! //タイマー

    
    var bAutoPlay : Bool  = false

    @IBAction func btnPlay(_ sender: Any) {
        print("------")
        print(bAutoPlay)
        if bAutoPlay {
            /*
            「停止」がタップされた
            →
             オートプレイを止める
             スライド切り替えボタンを使用可にする
             */
            // タイマーを停止する
            if let workingTimer = timer{
                workingTimer.invalidate()
            }
            btnPlay.setTitle("再生", for: .normal)
            bAutoPlay = false
            btnNext.isEnabled = true
            btnPrev.isEnabled = true
        }
        else {
            /*
             「再生」がタップされた
            　→
                スライド切り替えボタンを使用不可にする
                オートプレイにする。
             */
            btnNext.isEnabled = false
            btnPrev.isEnabled = false
            btnPlay.setTitle("停止", for: .normal)
            bAutoPlay = true
            // タイマー開始
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)

        }
    }
    @IBOutlet weak var btnPlay: UIButton!
    enum CMD: String {
        case c_next = "次"
        case c_prev = "前"
        case c_init = "はじめ"
    }    //　指定
    func showImage(_ sCmd : CMD) {
        
        switch sCmd {
        case CMD.c_prev:
            iCurrentIndex -= 1
            if iCurrentIndex < 0  {
                iCurrentIndex = arrPathImageFile.count - 1
            }
            break
        case CMD.c_next:
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

    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnPrev: UIButton!
    // 「進む」ボタンをタップ
    @IBAction func btnNext(_ sender: Any) {
        showImage(CMD.c_next)
    }
    // 「戻る」ボタンをタップ
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
            btnPlay.setTitle("再生", for: .normal)

        }
        catch let error {
            print("----------------------")

            print( error)
        }
        showImage(CMD.c_init)


        
    }
        @IBAction func unwind(_ segue: UIStoryboardSegue) {
            print("unwind()----------------------")

    }
    
    
}

