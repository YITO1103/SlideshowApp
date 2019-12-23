//
//  ViewController.swift
//  SlideshowApp
//
//  Created by user1 on 2019/12/23.
//  Copyright © 2019 yutaka.ito4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //for deb
        print(NSHomeDirectory())
        
        // ファイル一覧を取得するためfileManagerをインスタンス
        let fileManager = FileManager()
         
        // ファイル一覧の場所であるpathを文字列で取得
        //let path = Bundle.main.bundlePath
        let path = Bundle.main.bundlePath + "/images"

        do {
            let files = try fileManager.contentsOfDirectory(atPath: path)
         
            // png画像だけを集める配列を用意
            var images : [String] = []
            
            for file in files {
                // ファイル名の後方が.pngであればtrueとなる
                if file.hasSuffix(".png") {
                    images.append(file)
                }
            }
            print("----------------------")
            print( images)
            
        }
        catch let error {
            print("----------------------")

            print( error)
        }
    }
}

