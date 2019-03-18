import Foundation
import UIKit

public class RootViewController : UIViewController {
    
    override public func loadView() {
        super.loadView()
        let view = UIView()
        view.backgroundColor = .white

        self.view = view
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
    }
    
}
