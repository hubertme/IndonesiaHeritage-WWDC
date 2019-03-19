import Foundation
import UIKit

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
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.1183903292, green: 0.6762167215, blue: 1, alpha: 0.2286494007)
        self.setupElements()
        self.delegate?.setupWinningAnimation()
        
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            UIView.animate(withDuration: 1.5, animations: {
                self.headerLabel.alpha = 1
                self.subheaderLabel.alpha = 1
            }, completion: { (_) in
                UIView.animate(withDuration: 1.5, animations: {
                    self.thankYouEnglishLabel.alpha = 1
                    self.thankYouIndonesianLabel.alpha = 1
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
        self.headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        self.headerLabel.textColor = .black
        self.headerLabel.numberOfLines = 2
        self.headerLabel.textAlignment = .center
        self.headerLabel.text = "Bhinekka Tunggal Ika"
        self.headerLabel.sizeToFit()
        self.headerLabel.frame = CGRect(x: self.center.x - self.headerLabel.frame.width/2, y: 130, width: self.headerLabel.frame.width, height: self.headerLabel.frame.height)
        self.headerLabel.alpha = 0
        
        self.addSubview(self.headerLabel)
        
        self.subheaderLabel = UILabel()
        self.subheaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.subheaderLabel.textColor = .darkGray
        self.subheaderLabel.numberOfLines = 0
        self.subheaderLabel.textAlignment = .center
        self.subheaderLabel.text = "Unite in diversity\nWe are different but we are one\nThis is the spirit of Indonesian"
        self.subheaderLabel.sizeToFit()
        self.subheaderLabel.frame = CGRect(x: self.center.x - self.subheaderLabel.frame.width/2, y: self.headerLabel.frame.maxY + 32, width: self.subheaderLabel.frame.width, height: self.subheaderLabel.frame.height)
        self.subheaderLabel.alpha = 0
        
        self.addSubview(self.subheaderLabel)
        
        self.thankYouIndonesianLabel = UILabel()
        self.thankYouIndonesianLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        self.thankYouIndonesianLabel.textColor = .black
        self.thankYouIndonesianLabel.numberOfLines = 0
        self.thankYouIndonesianLabel.textAlignment = .center
        self.thankYouIndonesianLabel.text = "Terima kasih atas ulasan Anda!"
        self.thankYouIndonesianLabel.sizeToFit()
        print(self.thankYouIndonesianLabel.frame)
        self.thankYouIndonesianLabel.frame = CGRect(x: self.center.x - self.thankYouIndonesianLabel.frame.width/2, y: self.subheaderLabel.frame.maxY + 64, width: self.thankYouIndonesianLabel.frame.width, height: self.thankYouIndonesianLabel.frame.height)
        self.thankYouIndonesianLabel.alpha = 0
        
        self.addSubview(self.thankYouIndonesianLabel)
        
        self.thankYouEnglishLabel = UILabel()
        self.thankYouEnglishLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
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
}
