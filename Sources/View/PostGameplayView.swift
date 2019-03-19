import Foundation
import UIKit

protocol PostGameplayViewDelegate: class {
    func setupWinningAnimation()
}

public class PostGameplayView: UIView {
    
    // MARK: - Outlets
    var headerLabel: UILabel!
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
        headerLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        headerLabel.textColor = .black
        headerLabel.text = "Congratulations!"
        headerLabel.sizeToFit()
        headerLabel.center = self.center
        
        self.addSubview(headerLabel)
    }
}
