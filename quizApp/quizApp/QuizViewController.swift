//
//  QuizViewController.swift
//  quizApp
//
//  Created by saito,rui on 2023/06/12.
//

import UIKit

class QuizViewController: UIViewController {
    //紐付けはMainファイルからラベルなどのパーツをctrl + ドラッグアンドドロップ
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var asnwerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    //csvファイルを１行毎で配列に格納する変数
    var csvArray: [String] = []
    //1問ずつ抽出したデータ
    var quizArray: [String] = []
    //quizArray用のインデックスカウンター
    var quizCount = 0
    //正解数
    var correctCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
        //csvArrayの0番目を配列に代入
        quizArray = csvArray[quizCount].components(separatedBy: ",")
//        print(quizArray)
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        asnwerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)
        // Do any additional setup after loading the view.
    }
    
    //正解数を
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //ボタンを押された時の処理
    @IBAction func btnAction(sender: UIButton){
        //押されたボタンのタグと問題データのindex1が正解なのでそれと比較
        if sender.tag == Int(quizArray[1]){
            print("正解")
            correctCount += 1
            judgeImageView.image = UIImage(named: "correct")
        } else {
            print("不正解")
            judgeImageView.image = UIImage(named: "incorrect")
        }
        print("スコア：\(correctCount)")
        judgeImageView.isHidden = false
        answerButton1.isEnabled = false
        asnwerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        // 0.5秒後に画像を非表示にする
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 ) {
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
    
    func nextQuiz() {
        //次のデータをquizArrayに代入
        quizCount += 1
        // 次の問題があったら表示、なければ終了画面に推移
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            asnwerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
