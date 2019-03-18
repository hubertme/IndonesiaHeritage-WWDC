import Foundation
import UIKit

protocol CardCellDelegate: class {
    func cardCellTapped(at indexPath: IndexPath)
}

public class CardCell: UICollectionViewCell {
    
    // MARK: - Attributes
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    weak var delegate: CardCellDelegate?
    
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
        delegate?.cardCellTapped(at: self.indexPath)
    }
}
