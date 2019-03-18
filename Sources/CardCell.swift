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
//        let cardButton = UIButton(type: .custom)
//        cardButton.frame = self.contentView.frame
//        cardButton.backgroundColor = .blue
//        cardButton
        
        let singleCardView = UIView(frame: self.contentView.frame)
        singleCardView.backgroundColor = .black
        let tapToFlipGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardViewTapped))
        singleCardView.addGestureRecognizer(tapToFlipGesture)
        
        self.contentView.addSubview(singleCardView)
    }
    
    @objc private func handleCardViewTapped() {
        print("Card tapped!")
    }
}
