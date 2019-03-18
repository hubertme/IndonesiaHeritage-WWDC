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
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: 80, height: 200)
        
        cardCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        cardCollectionView.backgroundColor = .clear
        print(cardCollectionView.frame)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        cardCollectionView.register(CardCell.self, forCellWithReuseIdentifier: CardCell.description())
        
        self.view.addSubview(cardCollectionView)
    }
}

extension RootViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cardCell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCell.description(), for: indexPath) as! CardCell
        cardCell.cardImage = UIImage()
        print(cardCell.frame)
        return cardCell
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected at indexPath \(indexPath)")
    }
}
