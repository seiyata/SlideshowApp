//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by Seiya Tajikara on 2018/04/30.
//  Copyright © 2018年 seiya.tajikara. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet weak var zoomImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zoomImageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
