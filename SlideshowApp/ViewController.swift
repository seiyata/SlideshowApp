//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Seiya Tajikara on 2018/04/30.
//  Copyright © 2018年 seiya.tajikara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImageView: UIImageView!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var images: [UIImage] = []
    var index: Int = 0
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画像をクリック可能にする
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        slideImageView.isUserInteractionEnabled = true
        slideImageView.addGestureRecognizer(tapGestureRecognizer)
        
        // 画像を読み込む
        images.append(UIImage(named: "1.jpg")!)
        images.append(UIImage(named: "2.jpg")!)
        images.append(UIImage(named: "3.jpg")!)
        images.append(UIImage(named: "4.jpg")!)
        images.append(UIImage(named: "5.jpg")!)
        
        // 初期画像の指定
        slideImageView.image = images[index]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ズームページに移動する直前の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 現在の画像を渡す
        let zoomViewController: ZoomViewController = segue.destination as! ZoomViewController
        zoomViewController.image = images[index]
    }
    
    // ズームページから戻ってきた際の処理
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    // 画像をタップした際のイベントハンドラ
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        // スライドショーが再生中の場合は停止する
        if (self.timer != nil) {
            stopSlideShow()
        }

        // ズームページに移動
        self.performSegue(withIdentifier: "toZoom", sender: nil)
    }

    // 戻るボタンをタップした際のイベントハンドラ
    @IBAction func prevButtonTapped(_ sender: Any) {
        // 前の画像を表示
        if (index == 0) {
            index = images.count - 1
        } else {
            index = index - 1
        }
        slideImageView.image = images[index]
    }
    
    // 進むボタンをタップした際のイベントハンドラ
    @IBAction func nextButtonTapped(_ sender: Any) {
        // 次の画像を表示
        if (index == images.count - 1) {
            index = 0
        } else {
            index = index + 1
        }
        slideImageView.image = images[index]
    }
    
    // 再生ボタンをタップした際のイベントハンドラ
    @IBAction func playButtonTapped(_ sender: Any) {
        // 停止中の場合は自動再生をスタートさせる
        if self.timer == nil {
            startSlideShow()
        // 再生中の場合は自動再生を停止する
        } else {
            stopSlideShow()
        }
    }
    
    // スライドショーを開始する
    private func startSlideShow() {
        playButton.setTitle("停止", for: .normal)
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(nextButtonTapped), userInfo: nil, repeats: true)
        nextButton.isEnabled = false
        prevButton.isEnabled = false
    }
    
    // スライドショーを停止する
    private func stopSlideShow() {
        self.timer.invalidate()
        self.timer = nil
        playButton.setTitle("再生", for: .normal)
        nextButton.isEnabled = true
        prevButton.isEnabled = true
    }
}

