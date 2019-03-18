import Foundation
import UIKit

public class RootViewController : UIViewController {
    
    var cardCollectionView: UICollectionView!
    
//    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//
//    }
//
//    public required init?(coder aDecoder: NSCoder) {
//        fatalError("Init has not been implemented")
//    }
    
    override public func loadView() {
        super.loadView()
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 812)
        view.backgroundColor = .white

        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
        self.setupElements()
    }
    
    private func setupElements() {
        // Collection view
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.itemSize = CGSize(width: 80, height: 200)
        
        cardCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: flowLayout)
        cardCollectionView.backgroundColor = .blue
        print(cardCollectionView.frame)
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
        self.view.addSubview(cardCollectionView)
    }
}

extension RootViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

extension RootViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected at indexPath \(indexPath)")
    }
}
