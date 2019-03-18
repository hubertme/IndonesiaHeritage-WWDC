import Foundation
import UIKit

public class RootViewController : UIViewController, CardCellDelegate {
    
    // MARK: - Attributes
    var cardInformationSet = [CardInformation]()
    var cardsFinished: CGFloat = 0
    
    // MARK: - View properties
    var cardCollectionView: UICollectionView!
    
    // MARK: - Life cycle
    override public func loadView() {
        super.loadView()
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 812)
        view.backgroundColor = .white

        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElements()
        self.addDummyData()
    }
    
    // MARK: - Methods
    private func setupElements() {
        
        // Header label
        let headerLabel = UILabel()
        headerLabel.text = "Indonesia Heritage"
        headerLabel.textColor = .white
        headerLabel.backgroundColor = .red
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        headerLabel.font = UIFont.boldSystemFont(ofSize: 35)
        headerLabel.sizeToFit()
        headerLabel.frame.size = CGSize(width: self.view.frame.width, height: headerLabel.frame.height*2)
        
        self.view.addSubview(headerLabel)
        
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 20, right: 16)
        flowLayout.itemSize = CGSize(width: 100, height: 160)
        flowLayout.scrollDirection = .vertical
        
        cardCollectionView = UICollectionView(frame: CGRect(x: 0, y: headerLabel.frame.maxY, width: self.view.frame.width, height: self.view.frame.height - headerLabel.frame.height), collectionViewLayout: flowLayout)
        cardCollectionView.backgroundColor = .white
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.description())
        
        self.view.addSubview(cardCollectionView)
    }
    
    private func addDummyData() {
        for i in 1...9 {
            let cardInfo = CardInformation(title: "Card info #\(i)", description: "Lorem ipsum dolor sit amet")
            cardInformationSet.append(cardInfo)
        }
    }
}

// MARK: - Extensions
extension RootViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardInformationSet.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.description(), for: indexPath) as! CardCell
        cardCell.indexPath = indexPath
//        cardCell.cardInformation = cardInformationSet[indexPath.item]
//        cardCell.singleCardView.backgroundColor = !(cardInformationSet[indexPath.item].isOpened) ? .white : .red
        cardCell.singleCardView.backgroundColor = !(cardInformationSet[indexPath.item].isOpened) ? UIColor(patternImage: UIImage(named: "card-back.jpg")!) : .red
        cardCell.delegate = self
        return cardCell
    }
    
    public func cardCellTapped(at indexPath: IndexPath) {
        let cardCell = cardCollectionView.cellForItem(at: indexPath) as! CardCell
        
        if !cardInformationSet[indexPath.item].isOpened {
            UIView.transition(with: cardCell.singleCardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                cardCell.singleCardView.backgroundColor = .red
            }) { (_) in
                // Completion handler
            }
        } else {
            UIView.transition(with: cardCell.singleCardView, duration: 0.5, options: .transitionFlipFromRight, animations: {
                cardCell.singleCardView.backgroundColor = UIColor(patternImage: UIImage(named: "card-back.jpg")!)
                cardCell.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                cardCell.center = CGPoint(x: self.cardCollectionView.frame.maxX - cardCell.frame.width/2 - 20.0 - 10*self.cardsFinished, y: self.cardCollectionView.frame.minY + cardCell.frame.height/2 + 30.0)
                self.view.sendSubviewToBack(cardCell)
            }) { (_) in
                cardCell.isUserInteractionEnabled = false
                self.cardsFinished+=1
                self.view.sendSubviewToBack(cardCell.singleCardView)
            }
        }
        
        cardInformationSet[indexPath.item].isOpened = !(cardInformationSet[indexPath.item].isOpened)
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
}
