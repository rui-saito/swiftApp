//
//  ScoreViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit
import AVFoundation

class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var ansText: UILabel!
    
    var correct = 0
    var quizCnt = 0
    //音楽用
    let musicPath1 = Bundle.main.bundleURL.appendingPathComponent("donpahu.mp3")
    let musicPath2 = Bundle.main.bundleURL.appendingPathComponent("jan.mp3")
    let musicPath3 = Bundle.main.bundleURL.appendingPathComponent("tin.mp3")
    var musicPlayer = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(quizCnt)問中、\(correct)問正解！"
        if self.correct == 10 {
            ansText.text = "wonderful! Perfect answer!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                do {
                    self.musicPlayer = try AVAudioPlayer(contentsOf: self.musicPath1)
                    self.musicPlayer.play()
                } catch {
                    print("効果音の再生に失敗しました")
                }
            }
        } else if self.correct > 5 && self.correct <= 9 {
            ansText.text = "good answer!"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                do {
                    self.musicPlayer = try AVAudioPlayer(contentsOf: self.musicPath2)
                    self.musicPlayer.play()
                } catch {
                    print("効果音の再生に失敗しました")
                }
            }
        } else {
            ansText.text = "Let`s do our best"
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                
                do {
                    self.musicPlayer = try AVAudioPlayer(contentsOf: self.musicPath3)
                    self.musicPlayer.play()
                }catch {
                    print("効果音の再生に失敗しました")
                }
            }
        }
        
        // ビューの背景色を変更する
        self.view.backgroundColor = UIColor(red: 243/255, green: 232/255, blue: 209/255, alpha: 1.0)

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
