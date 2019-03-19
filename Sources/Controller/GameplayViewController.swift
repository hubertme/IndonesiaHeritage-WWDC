import Foundation
import UIKit
import AVFoundation

public class GameplayViewController : UIViewController, CardCellDelegate {
    
    // MARK: - Attributes
    var cardInformationSet = [CardInformation]()
    var cardsFinished: CGFloat = 0
    var previousCardInfo: (CardInformation, IndexPath)?
    
    // MARK: - View properties
    var cardCollectionView: UICollectionView!
    var informationView: UIView!
    var headerLabel: UILabel!
    var audioPlayer: AVAudioPlayer?
    
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
        self.playMusic()
        self.addDummyData()
        self.setupElements()
        
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
    }
    
    private func playMusic() {
        let musicUrl = URL(fileURLWithPath: Bundle.main.path(forResource: "Anjeun.mp3", ofType: nil)!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: musicUrl)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.play()
        } catch {
            print("Error in playing music \(error.localizedDescription)")
        }
    }
}

// MARK: - Extensions
extension GameplayViewController: UICollectionViewDataSource {
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
                    
                    self.cardCollectionView.isUserInteractionEnabled = false
                    
                    if currentCardInfo.title == previousCardInfo.title {
                        print("match!")
                        self.resizeAndStackCardView(sender: cardCell)
                        self.resizeAndStackCardView(sender: self.cardCollectionView.cellForItem(at: previousIndexPath) as! CardCell)
                        
                        let informationViewImage = UIImage(named: "info-\((self.cardInformationSet[indexPath.item].title).lowercased()).jpg") ?? UIImage()
                        let informationView = InformationView(frame: self.view.frame, title: currentCardInfo.title, information: currentCardInfo.description, image: informationViewImage)
                        informationView.delegate = self
                        informationView.alpha = 0
                        
                        self.informationView = informationView
                        self.view.addSubview(self.informationView)
                        
                        UIView.animate(withDuration: 0.5, animations: {
                            self.informationView.alpha = 1
                        }, completion: { (_) in
                            self.cardCollectionView.isUserInteractionEnabled = true
                        })
                        
                    } else {
                        self.flipBackCardView(sender: cardCell)
                        self.flipBackCardView(sender: self.cardCollectionView.cellForItem(at: previousIndexPath) as! CardCell)
                        
                        self.cardInformationSet[previousIndexPath.item].isOpened = false
                        self.cardInformationSet[indexPath.item].isOpened = false
                        
                        self.cardCollectionView.isUserInteractionEnabled = true
                    }
                } else {
                    self.previousCardInfo = (currentCardInfo, indexPath)
                }
            }
        } else {
            self.flipBackCardView(sender: cardCell)
            self.cardInformationSet[indexPath.item].isOpened = false
        }
    }
    
    private func resizeAndStackCardView(sender: CardCell) {
        UIView.transition(with: sender, duration: 0.5, options: .transitionFlipFromRight, animations: {
            sender.singleCardView.backgroundColor = UIColor(patternImage: UIImage(named: "card-back.jpg")!)
            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            sender.center = CGPoint(x: self.cardCollectionView.frame.maxX - sender.frame.width/2 - 20.0 - 10*self.cardsFinished, y: self.cardCollectionView.frame.minY + sender.frame.height/2 + 30.0)
            self.view.sendSubviewToBack(sender)
            sender.alpha = 0
        }) { (_) in
            sender.isUserInteractionEnabled = false
            self.cardsFinished+=1
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

extension GameplayViewController: UICollectionViewDelegateFlowLayout {
    
}

// Delegate for information view
extension GameplayViewController: InformationViewDelegate {
    func handleCloseButtonTapped() {
        print("Close button tapped!")
        self.informationView.removeFromSuperview()
    }
}
