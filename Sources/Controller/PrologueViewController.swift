import Foundation
import UIKit
import AVFoundation

public class PrologueViewController: UIViewController {
    
    // MARK: - Attributes
    var audioPlayer: AVAudioPlayer?
    
    // MARK: - Outlets
    var navigateButton: UIButton!
    
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
        
        self.view.addSubview(PostGameplayView())
    }
    
    // MARK: - Methods
    private func setupElements() {
        self.navigateButton = UIButton(type: .system)
        self.navigateButton.frame.size = CGSize(width: 70, height: 50)
        self.navigateButton.center = self.view.center
        self.navigateButton.setTitle("Navigate", for: .normal)
        self.navigateButton.addTarget(self, action: #selector(handleNavigateButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(self.navigateButton)
    }
    
    @objc private func handleNavigateButtonTapped() {
        let gameplayVC = GameplayViewController()
        self.present(gameplayVC, animated: true, completion: nil)
//        UIView.transition(from: self.view, to: gameplayVC.view, duration: 1, options: .transitionFlipFromLeft) { (_) in
//            self.navigationController?.viewControllers.remove(at: 0)
//            print(self.navigationController?.viewControllers)
//        }
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
