import Foundation
import UIKit

protocol InformationViewDelegate: class {
    func handleCloseButtonTapped()
}

public class InformationView: UIView {
    
    // MARK: - Attributes
    var title: String = ""
    var information: String = ""
    var imageSource: String = ""
    var image: UIImage = UIImage()
    weak var delegate: InformationViewDelegate?
    
    // MARK: - Outlets
    var titleLabel: UILabel!
    var informationLabel: UILabel!
    var imageView: UIImageView!
    var closeButton: UIButton!
    var imageSourceLabel: UILabel!
    
    // MARK: - Life cycle
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .darkGray
        
        self.closeButton = UIButton(type: .system)
        self.closeButton.frame = CGRect(x: self.frame.maxX - 70, y: self.frame.minY + 30, width: 50, height: 30)
        self.closeButton.setTitle("Close", for: .normal)
        self.closeButton.setTitleColor(.white, for: .normal)
        self.closeButton.addTarget(self, action: #selector(handleCloseButtonTapped), for: .touchUpInside)
        self.closeButton.alpha = 0
        
        self.addSubview(self.closeButton)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented!")
    }
    
    convenience init(frame: CGRect, title: String, information: String, image: UIImage, source: String) {
        self.init(frame: frame)
        
        self.title = title
        self.information = information
        self.image = image
        self.imageSource = source
        
        self.setupElements()
        UIView.animateKeyframes(withDuration: 4, delay: 0, options: .calculationModeLinear, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.15, animations: {
                self.titleLabel.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.15, relativeDuration: 0.15, animations: {
                self.imageView.alpha = 1
                self.imageSourceLabel.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.15, animations: {
                self.informationLabel.alpha = 1
            })
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15, animations: {
                self.closeButton.alpha = 1
            })
        }, completion: nil)
    }
    
    // MARK: - Methods
    @objc private func handleCloseButtonTapped() {
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }) { (_) in
            // Animation completion handler
            // Delegate to remove subview from parent view
            self.delegate?.handleCloseButtonTapped()
        }
    }
    
    private func setupElements() {
        // Title label
        self.titleLabel = UILabel(frame: CGRect(x: 16, y: self.closeButton.frame.maxY + 8, width: self.frame.width - 32, height: 35))
        self.titleLabel.textColor = .white
        self.titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        self.titleLabel.textAlignment = .center
        self.titleLabel.text = self.title
        self.titleLabel.numberOfLines = 1
        self.titleLabel.alpha = 0
        
        self.addSubview(self.titleLabel)
        
        // Image view
        let imageViewHeight: CGFloat = 275.0
        self.imageView = UIImageView(image: self.image)
        self.imageView.frame.size = CGSize(width: 400, height: imageViewHeight)
        self.imageView.center = CGPoint(x: self.center.x, y: self.titleLabel.frame.maxY + 16 + imageViewHeight/2)
        self.imageView.contentMode = .scaleAspectFit
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = .clear
        self.imageView.alpha = 0
        
        self.addSubview(self.imageView)
        
        // Credit label
        self.imageSourceLabel = UILabel()
        self.imageSourceLabel.textAlignment = .center
        self.imageSourceLabel.numberOfLines = 1
        self.imageSourceLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        self.imageSourceLabel.textColor = .lightGray
        self.imageSourceLabel.text = "Image by: \(self.imageSource)"
        self.imageSourceLabel.sizeToFit()
        self.imageSourceLabel.center = CGPoint(x: self.center.x, y: self.imageView.frame.maxY + self.imageSourceLabel.frame.height/2 + 4)
        self.imageSourceLabel.alpha = 0
        
        self.addSubview(self.imageSourceLabel)
        
        // Information label
        self.informationLabel = UILabel(frame: CGRect(x: 16, y: self.imageSourceLabel.frame.maxY + 16, width: self.frame.width - 32, height: 0))
        self.informationLabel.textColor = .white
        self.informationLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        self.informationLabel.textAlignment = .center
        self.informationLabel.text = self.information
        self.informationLabel.numberOfLines = 0
        self.informationLabel.sizeToFit()
        self.informationLabel.alpha = 0
        
        self.addSubview(self.informationLabel)
    }
}
