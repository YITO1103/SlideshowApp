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
    override func viewDidLayoutSubviews() {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("W,H)= (" + self.view.frame.width.description + "," + self.view.frame.height.description + ")")
        //let w = self.view.frame.width
        //let h = self.view.frame.height-40
        //let rect:CGRect = CGRect(x:0, y:0, width: w, height:h)
        //detailImageView.frame = rect

        
        // Do any additional setup after loading the view.
        detailImageView.image = self.detailImage
        labelFileName.text = sImageFileName

        
        
    }
    var sImageFileName:String? = nil
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

        if let sPath = sImageFileName {
            print("initUi()----------------------" + sPath)

            //detailImageView.image = detailImage
           
        }
        else {
            print("値が代入されていません")
        }
    }
}
