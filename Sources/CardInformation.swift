import Foundation
import UIKit

class CardInformation {
    var title: String
    var description: String
    var image: UIImage
    var isOpened = false
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.image = UIImage()
    }
}
