import Foundation
import UIKit

public class RootViewController : UIViewController, CardCellDelegate {
    
    // MARK: - Attributes
    var cardInformationSet = [CardInformation]()
    var cardsFinished: CGFloat = 0
    var previousCardInfo: (CardInformation, IndexPath)?
    
    // MARK: - View properties
    var cardCollectionView: UICollectionView!
    var informationView: UIView!
    var headerLabel: UILabel!
    
    // MARK: - Life cycle
    override public func loadView() {
        super.loadView()
        let view = UIView()
        view.frame.size = CGSize(width: 500, height: 700)
        view.backgroundColor = .white

        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupElements()
        self.addDummyData()
        
        self.cardInformationSet.forEach { (cardInfo) in
            print(cardInfo.title)
        }
    }
    
    // MARK: - Methods
    private func setupElements() {
        
        // Header label
        headerLabel = UILabel()
        headerLabel.text = "Indonesian Heritage"
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
        
        // Information view
        self.setupInformationView()
    }
    
    private func setupInformationView() {
        self.informationView = InformationView(frame: self.view.frame, title: "Something", information: "Something also", image: UIImage(named: "card-back.jpg") ?? UIImage())
        
        self.view.addSubview(self.informationView)
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
        cardCell.singleCardView.backgroundColor = !(cardInformationSet[indexPath.item].isOpened) ? UIColor(patternImage: UIImage(named: "card-back.jpg")!) : UIColor(patternImage: UIImage(named: "card-\((self.cardInformationSet[indexPath.item].title).lowercased()).jpg") ?? UIImage())
        cardCell.delegate = self
        return cardCell
    }
    
    public func cardCellTapped(at indexPath: IndexPath) {
        let cardCell = cardCollectionView.cellForItem(at: indexPath) as! CardCell
        
        if !cardInformationSet[indexPath.item].isOpened {
            UIView.transition(with: cardCell.singleCardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
                cardCell.singleCardView.backgroundColor = UIColor(patternImage: UIImage(named: "card-\((self.cardInformationSet[indexPath.item].title).lowercased()).jpg") ?? UIImage())
            }) { (_) in
                self.cardInformationSet[indexPath.item].isOpened = !(self.cardInformationSet[indexPath.item].isOpened)
                let currentCardInfo = self.cardInformationSet[indexPath.item]
                
                if let previousCardInfo = self.previousCardInfo?.0,
                    let previousIndexPath = self.previousCardInfo?.1 {
                    if currentCardInfo.title == previousCardInfo.title {
                        print("match!")
                        self.resizeAndStackCardView(sender: cardCell)
                        self.resizeAndStackCardView(sender: self.cardCollectionView.cellForItem(at: previousIndexPath) as! CardCell)
                    } else {
                        self.flipBackCardView(sender: cardCell)
                        self.flipBackCardView(sender: self.cardCollectionView.cellForItem(at: previousIndexPath) as! CardCell)
                        
                        self.cardInformationSet[previousIndexPath.item].isOpened = false
                        self.cardInformationSet[indexPath.item].isOpened = false
                    }
                } else {
                    self.previousCardInfo = (currentCardInfo, indexPath)
                }
            }
        } else {
            self.flipBackCardView(sender: cardCell)
        }
    }
    
    private func resizeAndStackCardView(sender: CardCell) {
        UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
            sender.singleCardView.backgroundColor = UIColor(patternImage: UIImage(named: "card-back.jpg")!)
            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            sender.center = CGPoint(x: self.cardCollectionView.frame.maxX - sender.frame.width/2 - 20.0 - 10*self.cardsFinished, y: self.cardCollectionView.frame.minY + sender.frame.height/2 + 30.0)
            self.view.sendSubviewToBack(sender)
        }) { (_) in
            sender.isUserInteractionEnabled = false
            self.cardsFinished+=1
//            self.view.sendSubviewToBack(sender.singleCardView)
            self.previousCardInfo = nil
        }
    }
    
    private func flipBackCardView(sender: CardCell) {
        UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
            sender.singleCardView.backgroundColor = UIColor(patternImage: UIImage(named: "card-back.jpg")!)
        }) { (_) in
            self.previousCardInfo = nil
        }
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
}

// Delegate for information view
extension RootViewController {
    
}
