//
//  ViewController.swift
//  FishPiano
//
//  Created by shoya on 2024/03/23.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playFish(sender: UIButton) {
        play(tag: sender.tag)
    }

    @IBAction func playFishesLeft(sender: UIButton) {
        play(tag: 1)
        play(tag: 3)
        play(tag: 5)
    }

    @IBAction func playFishesRight(sender: UIButton) {
        play(tag: 2)
        play(tag: 4)
        play(tag: 6)
    }

    // 音声を再生する
    func play(tag: Int) {
        SEManager.shared.play(fileName: "\(tag).mp3")

        // パラパラアニメの設定
        animate(tag: tag)
    }

    // アニメーションを再生
    func animate(tag: Int) {
        let button = self.view.viewWithTag(tag) as! UIButton


        let imageFish1 = UIImage(named: "fish1.png")
        let imageFish2 = UIImage(named: "fish2.png")
        button.imageView?.animationImages = [imageFish1!, imageFish2!]

        button.imageView?.animationDuration = 0.2
        button.imageView?.startAnimating()

        // 0.5秒でアニメーション
        UIView.animate(withDuration: 0.5, animations: {
            // 回転、移動、拡大を合成
            button.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/2)
                                .concatenating(CGAffineTransform(translationX: 0, y: -50))
                                .concatenating(CGAffineTransform(scaleX: 1.5, y: 1.5))
        }) {
            (_) in UIView.animate(withDuration: 0.5, animations: {
                // 元の状態に戻す
                button.transform = CGAffineTransform.identity
            }) {
                // パラパラアニメの終了
                (_) in button.imageView?.stopAnimating()
            }
        }
    }
}

