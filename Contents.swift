import UIKit
import PlaygroundSupport

public let screenSize = CGSize(width: 500, height: 700)

// Present the view controller in the Live View window
let rootVC = PrologueViewController()
rootVC.preferredContentSize = screenSize
PlaygroundPage.current.liveView = rootVC

