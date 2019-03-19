import UIKit
import PlaygroundSupport

public let screenSize = CGSize(width: 500, height: 700) // iPhone 5.5 Size

// Present the view controller in the Live View window
let gameplayVC = GameplayViewController()
gameplayVC.preferredContentSize = screenSize
PlaygroundPage.current.liveView = gameplayVC
