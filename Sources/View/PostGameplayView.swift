import Foundation
import UIKit

public class PostGameplayView: UIView {
    
    // MARK: - Outlets
    var headerLabel: UILabel!
    
    // MARK: - Lifecycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = #colorLiteral(red: 0.1183903292, green: 0.6762167215, blue: 1, alpha: 0.2286494007)
        self.setupElements()
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
