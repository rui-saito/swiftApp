import UIKit
import AVFoundation
//import AVKit
class ViewController: UIViewController, CAAnimationDelegate {
    @IBOutlet weak var musicON: UIButton!
    @IBOutlet weak var musicOFF: UIButton!
    @IBOutlet weak var digIcon: UIImageView!
    
    //音楽用
    let musicPath1 = Bundle.main.bundleURL.appendingPathComponent("music1.mp3")
    let musicPath2 = Bundle.main.bundleURL.appendingPathComponent("music2.mp3")
    var musicPlayer = AVAudioPlayer()
    //音楽用の乱数
    var musicRandom: [URL] = []
    var randomNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //音楽の設定
        musicRandom = [musicPath1, musicPath2]
        randomNumber = Int(arc4random_uniform(2))
        //画像の回転
        startRotationAnimation()
//        do {
//            musicPlayer = try AVAudioPlayer(contentsOf: musicRandom[randomNumber])
//            musicPlayer.play()
//        } catch {
//            print("効果音の再生に失敗しました")
//        }

    }

    @IBAction func music(_ sender: UIButton) {
        print(sender.tag)
        do {
            musicPlayer = try AVAudioPlayer(contentsOf:  musicRandom[randomNumber])
            musicPlayer.play()
        } catch {
            print("効果音の再生に失敗しました")
        }
    }
    
    @IBAction func musicOff(_ sender: UIButton) {
        print(sender.tag)
        musicPlayer.stop()
        musicPlayer.currentTime = 0
        randomNumber = Int(arc4random_uniform(2))
    }
    
    func startRotationAnimation() {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotationAnimation.toValue = CGFloat(Double.pi / 180) * 360
        rotationAnimation.duration = 3.0
        rotationAnimation.repeatCount = .greatestFiniteMagnitude
        rotationAnimation.delegate = self
        
        digIcon.layer.add(rotationAnimation, forKey: "rotationAnimation")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startRotationAnimation()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let presentationLayer = digIcon.layer.presentation(),
           let angle = presentationLayer.value(forKeyPath: "transform.rotation.y") as? Double {
            print("Rotation Angle:", angle)
        }
    }
    

    // ...
}
