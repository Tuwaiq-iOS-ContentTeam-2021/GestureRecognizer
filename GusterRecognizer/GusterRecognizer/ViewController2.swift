

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var monkey: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func panMonkey(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    

}
//#colorLiteral(red: 0.9962858558, green: 0.7961996198, blue: 0.9248743057, alpha: 1)
