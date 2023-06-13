//
//  QuizViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit
import AVFoundation
class QuizViewController: UIViewController {
    //紐付けはMainファイルからラベルなどのパーツをctrl + ドラッグアンドドロップ
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var asnwerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    @IBOutlet weak var faceImage: UIImageView!
    @IBOutlet weak var hintLabel: UILabel!
    //音楽用
    let musicPath1 = Bundle.main.bundleURL.appendingPathComponent("quiz2.mp3")
    let musicPath2 = Bundle.main.bundleURL.appendingPathComponent("quiz1.mp3")
    var musicPlayer = AVAudioPlayer()

    
    //csvファイルを１行毎で配列に格納する変数
    var csvArray: [String] = []
    //1問ずつ抽出したデータ
    var quizArray: [String] = []
    //quizArray用のインデックスカウンター
    var quizCount = 0
    //正解数
    var correctCount = 0
    //問題用の乱数
    var randomNumbers = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //問題用の乱数生成
        let randomNumbers = createRandomNum()
        print("生成された乱数: \(randomNumbers)")
        // 正解、不正解の画像は最前面
        self.view.bringSubviewToFront(judgeImageView)
        //CSV読み込み
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
        //csvArrayのランダムな問題 1問分を配列に代入
        quizArray = csvArray[randomNumbers[quizCount]].components(separatedBy: ",")
//        print(quizArray)
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        faceImage.image = UIImage(named: quizArray[1])
        hintLabel.text = quizArray[2]
        answerButton1.setTitle(quizArray[4], for: .normal)
        asnwerButton2.setTitle(quizArray[5], for: .normal)
        answerButton3.setTitle(quizArray[6], for: .normal)
        answerButton4.setTitle(quizArray[7], for: .normal)
        // Do any additional setup after loading the view.
    }
    
    //正解数を次のページに送る
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
        scoreVC.quizCnt = randomNumbers.count
    }
    
    //ボタンを押された時の処理
    @IBAction func btnAction(sender: UIButton){
        //押されたボタンのタグと問題データのindex3が正解なのでそれと比較
        if sender.tag == Int(quizArray[3]){
            print("正解")
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: musicPath1)
                musicPlayer.play()
            } catch {
                print("効果音の再生に失敗しました")
            }
            correctCount += 1
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            do {
                musicPlayer = try AVAudioPlayer(contentsOf: musicPath2)
                musicPlayer.play()
            } catch {
                print("効果音の再生に失敗しました")
            }
            judgeImageView.image = UIImage(named: "incorrect")
            
        }
        print("スコア：\(correctCount)")
        judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        asnwerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        // 0.5秒後に画像を非表示にする
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0 ) {
            self.judgeImageView.isHidden = true
            //クロージャーだからselfが必要
            self.judgeImageView.isHidden = true
            self.answerButton1.isEnabled = true
            self.asnwerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.nextQuiz()
        }
        
        
    }
    
    //次の問題
    func nextQuiz() {
        //次のデータをquizArrayに代入
        quizCount += 1
        // 次の問題があったら表示、なければ終了画面に推移
        if quizCount < randomNumbers.count {
            quizArray = csvArray[randomNumbers[quizCount]].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            faceImage.image = UIImage(named: quizArray[1])
            hintLabel.text = quizArray[2]
            answerButton1.setTitle(quizArray[4], for: .normal)
            asnwerButton2.setTitle(quizArray[5], for: .normal)
            answerButton3.setTitle(quizArray[6], for: .normal)
            answerButton4.setTitle(quizArray[7], for: .normal)

        } else {
                self.performSegue(withIdentifier: "toScoreVC", sender: nil)
            
            
        }
    }
    
    //csv読み込み処理,配列に入れている 処理の中身としては、1行ずつを文字列にして配列に格納する
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do{
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("error")
        }
        return csvArray
    }
    
    
    func createRandomNum() -> [Int] {

        while randomNumbers.count < 10 {
            let randomNumber = Int(arc4random_uniform(27))
            if !randomNumbers.contains(randomNumber) {
                randomNumbers.append(randomNumber)
            }
        }
        return randomNumbers
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
