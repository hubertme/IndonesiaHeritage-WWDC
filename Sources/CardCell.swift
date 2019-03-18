import Foundation
import UIKit

public class CardCell: UICollectionViewCell {
    
    // MARK: - Attributes
    var cardImage = UIImage()
    
    // MARK: - Life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.setupElements()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented!")
    }
    
    // MARK: - Methods
    private func setupElements() {
        print("Ready to setup elements!")
    }
}
