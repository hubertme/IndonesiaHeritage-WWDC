import Foundation
import UIKit

public class InformationView: UIView {
    
    // MARK: - Attributes
    var title: String = ""
    var information: String = ""
    var image: UIImage = UIImage()
    
    // MARK: - Outlets
    var titleLabel: UILabel!
    var informationLabel: UILabel!
    var imageView: UIImageView!
    var closeButton: UIButton!
    
    // MARK: - Life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        self.closeButton = UIButton(type: .system)
        self.closeButton.frame = CGRect(x: self.frame.maxX - 70, y: self.frame.minY + 30, width: 50, height: 30)
        self.closeButton.setTitle("Close", for: .normal)
        self.closeButton.setTitleColor(.white, for: .normal)
        self.closeButton.addTarget(self, action: #selector(handleCloseButtonTapped), for: .touchUpInside)
        
        self.addSubview(self.closeButton)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented!")
    }
    
    convenience init(frame: CGRect, title: String, information: String, image: UIImage) {
        self.init(frame: frame)
        
        self.title = title
        self.information = information
        self.image = image
        
        self.setupElements()
        
//        print(self.title, self.information, self.image)
    }
    
    // MARK: - Methods
    @objc private func handleCloseButtonTapped() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (_) in
            // Animation completion handler
            // Delegate to remove subview from parent view
        }
    }
    
    private func setupElements() {
        // Title label
        titleLabel = UILabel(frame: CGRect(x: 16, y: self.closeButton.frame.maxY + 16, width: self.frame.width - 32, height: 50))
        titleLabel.textColor = .white
        titleLabel.backgroundColor = .clear
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.text = self.title
        titleLabel.numberOfLines = 1
        
        self.addSubview(titleLabel)
        
        // Image view
        
        // Information label
    }
}
