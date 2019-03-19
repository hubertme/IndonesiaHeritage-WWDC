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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            UIView.animate(withDuration: 2, animations: {
                self.merdekaProgressView.frame.size = CGSize(width: self.merdekaLabel.frame.width, height: self.merdekaProgressView.frame.height)
                self.view.layoutIfNeeded()
            }, completion: { (_) in
                print("Animation ended")
            })
        }
        
//        self.view.addSubview(PostGameplayView(frame: self.view.frame))
    }
    
    // MARK: - Methods
    private func setupElements() {
        self.navigateButton = UIButton(type: .system)
        self.navigateButton.frame.size = CGSize(width: 70, height: 50)
        self.navigateButton.center = self.view.center
        self.navigateButton.setTitle("Navigate", for: .normal)
        self.navigateButton.addTarget(self, action: #selector(handleNavigateButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(self.navigateButton)
        
        // Merdeka label
        self.merdekaLabel = UILabel()
        self.merdekaLabel.textAlignment = .center
        self.merdekaLabel.textColor = .clear
        self.merdekaLabel.backgroundColor = self.backgroundColor
        self.merdekaLabel.font = UIFont.systemFont(ofSize: 60, weight: .bold)
        self.merdekaLabel.text = "MERDEKA"
        self.merdekaLabel.sizeToFit()
        self.merdekaLabel.frame = CGRect(x: self.view.center.x - self.merdekaLabel.frame.width/2, y: 100, width: self.merdekaLabel.frame.width, height: self.merdekaLabel.frame.height)
        
        self.view.addSubview(self.merdekaLabel)
        
        // Merdeka progress bar
        self.merdekaProgressView = UIView(frame: self.merdekaLabel.frame)
        self.merdekaProgressView.frame.size = CGSize(width: 0, height: self.merdekaProgressView.frame.height)
        self.merdekaProgressView.backgroundColor = .red
        self.merdekaLabel.sendSubviewToBack(merdekaProgressView)
        print(self.merdekaProgressView.frame, self.merdekaLabel.frame)
//        self.merdekaProgressView.sendSubviewToBack(self.merdekaLabel)
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
