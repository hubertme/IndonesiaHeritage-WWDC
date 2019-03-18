import Foundation
import UIKit

public class RootViewController : UIViewController {
    
    var cardCollectionView: UICollectionView!
    
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
    }
    
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
}

extension RootViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.description(), for: indexPath) as! CardCell
        cardCell.cardImage = UIImage()
        print("card at \(indexPath.item) frame: \(cardCell.frame)")
        return cardCell
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected at indexPath \(indexPath)")
    }
}
