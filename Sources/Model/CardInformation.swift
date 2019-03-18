import Foundation
import UIKit

public struct CardInformation {
    var title: String
    var description: String
    var isOpened = false
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}
