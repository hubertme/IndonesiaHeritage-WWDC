import Foundation
import UIKit

public class InformationView: UIView {
    
    // MARK: - Attributes
    var title: String = ""
    var information: String = ""
    var image: UIImage = UIImage()
    
    // MARK: - Life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        let closeButton = UIButton(type: .system)
        closeButton.frame = CGRect(x: self.frame.maxX - 70, y: self.frame.minY + 30, width: 50, height: 30)
        closeButton.setTitle("Close", for: .normal)
        closeButton.setTitleColor(.white, for: .normal)
        
        print("Close button frame: \(closeButton.frame) and information view frame: \(self.frame)")
        self.addSubview(closeButton)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented!")
    }
    
    convenience init(frame: CGRect, title: String, information: String, image: UIImage) {
        self.init(frame: frame)
        self.title = title
        self.information = information
        self.image = image
        
        print(self.title, self.information, self.image)
    }
    
    // MARK: - Methods
}
