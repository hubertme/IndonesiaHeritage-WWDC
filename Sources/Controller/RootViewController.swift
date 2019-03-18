import Foundation
import UIKit

public class RootViewController : UIViewController, CardCellDelegate {
    
    // MARK: - Attributes
    var cardInformationSet = [CardInformation]()
    
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
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 16, width: self.view.frame.width, height: 40))
        headerLabel.text = "Indonesia Heritage Card"
        headerLabel.textColor = .black
        headerLabel.textAlignment = .center
        headerLabel.numberOfLines = 0
        headerLabel.font = UIFont.systemFont(ofSize: 30)
        
        self.view.addSubview(headerLabel)
        
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        flowLayout.itemSize = CGSize(width: 100, height: 160)
        flowLayout.scrollDirection = .vertical
        
        cardCollectionView = UICollectionView(frame: CGRect(x: 0, y: headerLabel.frame.maxY + 10, width: self.view.frame.width, height: self.view.frame.height - headerLabel.frame.height - 10), collectionViewLayout: flowLayout)
        cardCollectionView.backgroundColor = .lightGray
        print(cardCollectionView.frame)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.description())
        
        self.view.addSubview(cardCollectionView)
    }
    
    private func addDummyData() {
        for i in 1...32 {
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
        cardCell.singleCardView.backgroundColor = !(cardInformationSet[indexPath.item].isOpened) ? .white : .red
        cardCell.delegate = self
        print("card at \(indexPath.item) frame: \(cardCell.frame)")
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
                cardCell.singleCardView.backgroundColor = .white
            }) { (_) in
                // Completion handler
            }
        }
        cardInformationSet[indexPath.item].isOpened = !(cardInformationSet[indexPath.item].isOpened)
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
}