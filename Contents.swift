//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

public let screenSize = CGSize(width: 375, height: 812) // iPhone 4.7 Size

// Present the view controller in the Live View window
let rootVC = RootViewController()
rootVC.preferredContentSize = screenSize
PlaygroundPage.current.liveView = rootVC
