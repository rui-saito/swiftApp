//
//  ScoreViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    var correct = 0
    var quizCnt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(quizCnt)問中、\(correct)問正解！"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        //dismiss 画面を退室させる animated: 動きを入れるかどうか
        // presentingViewControllerで今の画面を選択つまりトップに戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
