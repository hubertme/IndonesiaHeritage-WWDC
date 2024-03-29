import Foundation
import UIKit

protocol CardCellDelegate: class {
    func cardCellTapped(at indexPath: IndexPath)
}

public class CardCell: UICollectionViewCell {
    
    // MARK: - Attributes
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    weak var delegate: CardCellDelegate?
    var cardInformation: CardInformation?
    
    // MARK: - View Properties
    var singleCardView: UIView!
    var informationView: UIView!
    
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
        
        self.singleCardView = UIView(frame: self.contentView.frame)
        self.singleCardView.clipsToBounds = true
        self.singleCardView.layer.cornerRadius = 8
        self.singleCardView.contentMode = .scaleAspectFit
        let tapToFlipGesture = UITapGestureRecognizer(target: self, action: #selector(handleCardViewTapped))
        self.singleCardView.addGestureRecognizer(tapToFlipGesture)
        
        self.contentView.addSubview(singleCardView)
    }
    
    @objc private func handleCardViewTapped() {
        delegate?.cardCellTapped(at: self.indexPath)
    }
}
