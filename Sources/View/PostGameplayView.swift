import Foundation
import UIKit
import AVFoundation

protocol PostGameplayViewDelegate: class {
    func setupWinningAnimation()
}

public class PostGameplayView: UIView {
    
    // MARK: - Outlets
    var headerLabel: UILabel!
    var subheaderLabel: UILabel!
    var thankYouIndonesianLabel: UILabel!
    var thankYouEnglishLabel: UILabel!
    weak var delegate: PostGameplayViewDelegate?
    var audioPlayer: AVAudioPlayer?
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.backgroundColor = #colorLiteral(red: 0.9631918073, green: 0.9041539431, blue: 0.337795198, alpha: 0.2451840753)
        self.setupElements()
        print(self.delegate)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.playClapSound(volume: 90)
            
            UIView.animate(withDuration: 1.5, animations: {
                self.headerLabel.alpha = 1
                self.subheaderLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 1.5, delay: 1, options: .curveLinear, animations: {
                    self.thankYouEnglishLabel.alpha = 1
                    self.thankYouIndonesianLabel.alpha = 1
                }, completion: { (_) in
                    // Completion handler
                })
            })
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented!")
    }
    
    // MARK: - Methods
    private func setupElements() {
        self.headerLabel = UILabel()
        self.headerLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        self.headerLabel.textColor = .black
        self.headerLabel.numberOfLines = 2
        self.headerLabel.textAlignment = .center
        self.headerLabel.text = "Connected in Distance"
        self.headerLabel.sizeToFit()
        self.headerLabel.frame = CGRect(x: self.center.x - self.headerLabel.frame.width/2, y: 100, width: self.headerLabel.frame.width, height: self.headerLabel.frame.height)
        self.headerLabel.alpha = 0
        
        self.addSubview(self.headerLabel)
        
        self.subheaderLabel = UILabel()
        self.subheaderLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        self.subheaderLabel.textColor = .darkGray
        self.subheaderLabel.numberOfLines = 0
        self.subheaderLabel.textAlignment = .center
        self.subheaderLabel.text = "Spreaded across Indonesia,\nyet connected and remembered always.\nJust like the cards.\n\nThis is the spirit of Indonesia that\nThe World acknowledge..."
        self.subheaderLabel.sizeToFit()
        self.subheaderLabel.frame = CGRect(x: self.center.x - self.subheaderLabel.frame.width/2, y: self.headerLabel.frame.maxY + 32, width: self.subheaderLabel.frame.width, height: self.subheaderLabel.frame.height)
        self.subheaderLabel.alpha = 0
        
        self.addSubview(self.subheaderLabel)
        
        self.thankYouIndonesianLabel = UILabel()
        self.thankYouIndonesianLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        self.thankYouIndonesianLabel.textColor = .black
        self.thankYouIndonesianLabel.numberOfLines = 0
        self.thankYouIndonesianLabel.textAlignment = .center
        self.thankYouIndonesianLabel.text = "Terima kasih!"
        self.thankYouIndonesianLabel.sizeToFit()
        print(self.thankYouIndonesianLabel.frame)
        self.thankYouIndonesianLabel.frame = CGRect(x: self.center.x - self.thankYouIndonesianLabel.frame.width/2, y: self.subheaderLabel.frame.maxY + 100, width: self.thankYouIndonesianLabel.frame.width, height: self.thankYouIndonesianLabel.frame.height)
        self.thankYouIndonesianLabel.alpha = 0
        
        self.addSubview(self.thankYouIndonesianLabel)
        
        self.thankYouEnglishLabel = UILabel()
        self.thankYouEnglishLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        self.thankYouEnglishLabel.textColor = .gray
        self.thankYouEnglishLabel.numberOfLines = 0
        self.thankYouEnglishLabel.textAlignment = .center
        self.thankYouEnglishLabel.text = "Thank you for reviewing my app!"
        self.thankYouEnglishLabel.sizeToFit()
        self.thankYouEnglishLabel.frame = CGRect(x: self.center.x - self.thankYouEnglishLabel.frame.width/2, y: self.thankYouIndonesianLabel.frame.maxY + 8, width: self.thankYouEnglishLabel.frame.width, height: self.thankYouEnglishLabel.frame.height)
        self.thankYouEnglishLabel.alpha = 0
        
        self.addSubview(self.thankYouEnglishLabel)
        
        print(self.headerLabel.frame)
    }
    
    private func playClapSound(volume: Float) {
        let musicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "clap.wav", ofType: nil)!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            audioPlayer?.numberOfLoops = 1
            audioPlayer?.volume = volume
            audioPlayer?.play()
        } catch {
            print("Error in playing music \(error.localizedDescription)")
        }
    }
}
