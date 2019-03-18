import Foundation
import UIKit

public class RootViewController : UIViewController, CardCellDelegate {
    
    // MARK: - Attributes
    var cardInformationSet = [CardInformation]()
    var cardsFinished: CGFloat = 0
    var previousCardInfo: (CardInformation, IndexPath)?
    
    // MARK: - View properties
    var cardCollectionView: UICollectionView!
    
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
        let headerLabel = UILabel()
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
    
    private func addDummyData() {
        cardInformationSet.append(CardInformation(title: "Batik", description: "Batik is a technique of wax-resist dyeing applied to whole cloth, or cloth made using this technique, originated from Indonesia, Batik is made either by drawing dots and lines of the resist with a spouted tool called a canting, or by printing the resist with a copper stamp called a cap. The applied wax resists dyes and therefore allows the artisan to colour selectively by soaking the cloth in one colour, removing the wax with boiling water, and repeating if multiple colours are desired.\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Kecak", description: "Kecak dance, known in Indonesian as Tari Kecak, is a form of Balinese hindu dance and music drama that was developed in the 1930s in Bali, Indonesia. Since its creation it has been performed primarily by men, with the very first women's kecak group starting in 2006. The dance mainly plays about the Ramayana and is traditionally performed in temples and villages across Bali.\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Rendang", description: "Rendang is a spicy meat dish which originated in Indonesia, especially the ethnic group of Minangkabau people, and is now commonly served across the country. One of the characteristic foods of Minangkabau culture, it is served at ceremonial occasions and to honour guests. Rendang is also served among the Malay community. Rendang is traditionally prepared by the Minangkabau community during festive occasions such as traditional ceremonies, wedding feasts and Hari Raya (Eid al-Fitr).\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Borobudur", description: "This famous Buddhist temple, dating from the 8th and 9th centuries, is located in central Java. It was built in three tiers: a pyramidal base with five concentric square terraces, the trunk of a cone with three circular platforms and, at the top, a monumental stupa. The walls and balustrades are decorated with fine low reliefs, covering a total surface area of 2,500 m2. Around the circular platforms are 72 openwork stupas, each containing a statue of the Buddha. The monument was restored with UNESCO's help in the 1970s\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Silat", description: "Pencak silat is an umbrella term for a class of related Indonesian martial arts. In neighbouring countries the term usually refers to professional competitive silat. It is a full-body fighting form incorporating strikes, grappling and throwing in addition to weaponry. Every part of the body is used and subject to attack. Pencak silat was practiced not only for physical defense but also for psychological ends\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Angklung", description: "The angklung is a musical instrument from Indonesia made of a varying number of bamboo tubes attached to a bamboo frame. The tubes are carved to have a resonant pitch when struck and are tuned to octaves, similar to Western handbells. The base of the frame is held in one hand, whilst the other hand shakes the instrument, causing a repeating note to sound. Each of three or more performers in an angklung ensemble play just one note or more, but altogether complete melodies are produced.\n(copyright of Wikipedia)"))
        cardInformationSet.append(CardInformation(title: "Wayang", description: "Wayang, also known as Wajang, is a form of puppet theatre art found in Indonesia and other parts of Southeast Asia, wherein a dramatic story is told through shadows thrown by puppets and sometimes combined with human characters. The art form celebrates the Indonesian culture and artistic talent; its origins are traced to the spread of Hinduism in the medieval era and the arrival of leather-based puppet arts called Tholu bommalata from southern India.\n(copyright of Wikipedia)"))
        
        cardInformationSet.forEach { (cardInfo) in
            self.cardInformationSet.append(cardInfo)
        }
        
        cardInformationSet.shuffle()
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
                cardCell.titleLabel.alpha = 1
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
            sender.titleLabel.alpha = 0
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
            sender.titleLabel.alpha = 0
        }) { (_) in
            self.previousCardInfo = nil
        }
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    
}
