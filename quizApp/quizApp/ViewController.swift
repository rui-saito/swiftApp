//
//  ViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var logoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 使用例
        startRotatingView(view: logoImage)

        // Do any additional setup after loading the view.
    }
    //回転させる処理
    func startRotatingView(view: UIView, duration: Double = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            view.transform = view.transform.rotated(by: CGFloat.pi)
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }) { (_) in
            self.startRotatingView(view: view, duration: duration)
        }
    }


}

