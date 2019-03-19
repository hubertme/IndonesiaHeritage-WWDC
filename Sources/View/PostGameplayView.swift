import Foundation
import UIKit

protocol PostGameplayViewDelegate: class {
    func setupWinningAnimation()
}

public class PostGameplayView: UIView {
    
    // MARK: - Outlets
    var headerLabel: UILabel!
    var subheaderLabel: UILabel!
    weak var delegate: PostGameplayViewDelegate?
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.1183903292, green: 0.6762167215, blue: 1, alpha: 0.2286494007)
        self.setupElements()
        self.delegate?.setupWinningAnimation()
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
        self.headerLabel.center = self.center
        
        self.addSubview(self.headerLabel)
        
        self.subheaderLabel = UILabel()
        self.subheaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        self.subheaderLabel.textColor = .darkGray
        self.subheaderLabel.numberOfLines = 0
        self.subheaderLabel.textAlignment = .center
        self.subheaderLabel.text = "Unite in diversity\nWe are different but we are one\nThis is the spirit of Indonesian"
        self.subheaderLabel.sizeToFit()
        self.subheaderLabel.center = CGPoint(x: self.center.x, y: self.headerLabel.frame.maxY + self.subheaderLabel.frame.height/2 + 16)
        
        self.addSubview(self.subheaderLabel)
    }
}
