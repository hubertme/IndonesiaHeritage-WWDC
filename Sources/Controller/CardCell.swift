import Foundation
import UIKit

public class CardCell: UICollectionViewCell {
    
    // MARK: - Attributes
    var cardInformation: CardInformation!
    
    // MARK: - View Properties
    var singleCardView: UIView!
    
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
        
        singleCardView = UIView(frame: self.contentView.frame)
        singleCardView.backgroundColor = .white
        let tapToFlipGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardViewTapped))
        singleCardView.addGestureRecognizer(tapToFlipGesture)
        
        self.contentView.addSubview(singleCardView)
    }
    
    @objc private func handleCardViewTapped() {
        if !cardInformation.isOpened {
            UIView.transition(with: singleCardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                self.singleCardView.backgroundColor = .red
            }) { (_) in
                // Completion handler
            }
        } else {
            UIView.transition(with: singleCardView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                self.singleCardView.backgroundColor = .white
            }) { (_) in
                // Completion handler
            }
        }
        cardInformation.isOpened = !(cardInformation.isOpened)
    }
}
