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


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImageView.image = self.detailImage
        
    }
    var sImagePath:String? = nil
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

        if let sPath = sImagePath {
            print("initUi()----------------------" + sPath)

            //detailImageView.image = detailImage
            
        }
        else {
            print("値が代入されていません")
        }
    }
}
