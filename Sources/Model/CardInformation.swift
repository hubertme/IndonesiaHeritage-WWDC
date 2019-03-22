import Foundation
import UIKit

public struct CardInformation {
    var title: String
    var description: String
    var imageSource: String
    var isOpened = false
    
    init(title: String, description: String, imageSource: String) {
        self.title = title
        self.description = description
        self.imageSource = imageSource
    }
}
