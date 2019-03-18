//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public let screenSize = CGSize(width: 500, height: 700) // iPhone 5.5 Size

// Present the view controller in the Live View window
let rootVC = RootViewController()
rootVC.preferredContentSize = screenSize
PlaygroundPage.current.liveView = rootVC
