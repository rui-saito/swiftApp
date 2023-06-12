//
//  ViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var digIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 回転 "transform.rotation.y" x,y,z 指定することで方向を変えれる。
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotationAnimation.toValue = CGFloat(Double.pi / 180) * 360
        rotationAnimation.duration = 3.0
        rotationAnimation.repeatCount = .greatestFiniteMagnitude

        digIcon.layer.add(rotationAnimation, forKey: "rotationAnimation")

        // Do any additional setup after loading the view.
    }
}

