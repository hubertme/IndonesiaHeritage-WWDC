import Foundation
import UIKit
import AVFoundation

public class PrologueViewController: UIViewController {
    
    // MARK: - Attributes
    var audioPlayer: AVAudioPlayer?
    let backgroundColor: UIColor = UIColor.white
    
    // MARK: - Outlets
    var navigateButton: UIButton!
    var merdekaLabel: UILabel!
    var merdekaProgressView: UIView!
    var welcomeIndonesianLabel: UILabel!
    var welcomeEnglishLabel: UILabel!
    var coverImageView: UIImageView!
    
    // MARK: - Life cycle
    public override func loadView() {
        super.loadView()
        
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 500, height: 700)
        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.playMusic()
        self.setupElements()
        
        UIView.animate(withDuration: 1, animations: {
            self.welcomeIndonesianLabel.alpha = 1
        }) { (_) in
            UIView.animate(withDuration: 1, delay: 1, options: .curveLinear, animations: {
                self.welcomeEnglishLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 2, delay: 1, options: .curveLinear, animations: {
                    self.merdekaProgressView.frame.size = CGSize(width: self.merdekaLabel.frame.width+32, height: self.merdekaProgressView.frame.height)
                    self.view.layoutIfNeeded()
                }, completion: { (_) in
                    print("Animation ended")
                    sleep(1)
                    self.handleNavigateButtonTapped()
                })
            })
        }
        
//        self.view.addSubview(PostGameplayView(frame: self.view.frame))
    }
    
    // MARK: - Methods
    private func setupElements() {
        
        // Cover image view
        self.coverImageView = UIImageView(image: UIImage(named: "indonesia.jpg") ?? UIImage())
        self.coverImageView.contentMode = .scaleAspectFill
        self.coverImageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 0.75*self.view.frame.width)
        self.coverImageView.clipsToBounds = true
        self.view.addSubview(self.coverImageView)
        
        // Welcome Indonesian label
        self.welcomeIndonesianLabel = UILabel()
        self.welcomeIndonesianLabel.textAlignment = .center
        self.welcomeIndonesianLabel.textColor = .black
        self.welcomeIndonesianLabel.numberOfLines = 0
        self.welcomeIndonesianLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.welcomeIndonesianLabel.text = "Selamat datang"
        self.welcomeIndonesianLabel.sizeToFit()
        self.welcomeIndonesianLabel.frame = CGRect(x: self.view.center.x - self.welcomeIndonesianLabel.frame.width/2, y: self.coverImageView.frame.maxY+32, width: self.welcomeIndonesianLabel.frame.width, height: self.welcomeIndonesianLabel.frame.height)
        self.welcomeIndonesianLabel.alpha = 0
        
        self.view.addSubview(self.welcomeIndonesianLabel)
        
        // Welcome English label
        self.welcomeEnglishLabel = UILabel()
        self.welcomeEnglishLabel.textAlignment = .center
        self.welcomeEnglishLabel.textColor = .gray
        self.welcomeEnglishLabel.numberOfLines = 0
        self.welcomeEnglishLabel.font = UIFont.systemFont(ofSize: 28, weight: .light)
        self.welcomeEnglishLabel.text = "Welcome onboard\nPlease enjoy a glimpse of Indonesia"
        self.welcomeEnglishLabel.sizeToFit()
        self.welcomeEnglishLabel.frame = CGRect(x: self.view.center.x - self.welcomeEnglishLabel.frame.width/2, y: self.welcomeIndonesianLabel.frame.maxY+8, width: self.welcomeEnglishLabel.frame.width, height: self.welcomeEnglishLabel.frame.height)
        self.welcomeEnglishLabel.alpha = 0
        
        self.view.addSubview(self.welcomeEnglishLabel)
        
        // Merdeka label
        self.merdekaLabel = UILabel()
        self.merdekaLabel.textAlignment = .center
        self.merdekaLabel.textColor = .white
        //        self.merdekaLabel.backgroundColor = self.backgroundColor
        self.merdekaLabel.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        self.merdekaLabel.text = "MERDEKA!"
        self.merdekaLabel.sizeToFit()
        self.merdekaLabel.frame = CGRect(x: self.view.center.x - self.merdekaLabel.frame.width/2, y: self.welcomeEnglishLabel.frame.maxY + 32, width: self.merdekaLabel.frame.width, height: self.merdekaLabel.frame.height)
        
        self.view.addSubview(self.merdekaLabel)
        
        // Merdeka progress bar
        self.merdekaProgressView = UIView(frame: CGRect(x: self.merdekaLabel.frame.minX-16, y: self.merdekaLabel.frame.minY-8, width: 0, height: self.merdekaLabel.frame.height+16))
        self.merdekaProgressView.backgroundColor = .red
        
        self.view.insertSubview(self.merdekaProgressView, belowSubview: self.merdekaLabel)
    }
    
    @objc private func handleNavigateButtonTapped() {
        let gameplayVC = GameplayViewController()
        self.present(gameplayVC, animated: true, completion: nil)
        
    }
    
    private func playMusic() {
        let musicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "Anjeun.mp3", ofType: nil)!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error in playing music \(error.localizedDescription)")
        }
    }
}
