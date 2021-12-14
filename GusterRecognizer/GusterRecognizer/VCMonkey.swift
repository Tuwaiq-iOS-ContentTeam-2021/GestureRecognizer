

import UIKit

class VCMonkey: UIViewController {

    @IBOutlet weak var monkey: UIImageView!
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var banana: UIImageView!
    var monkeyViewRigon : CGPoint!
    var initialCenter = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        monkeyViewRigon = monkey.frame.origin
    }
    
    @IBAction func panMonkey(_ sender: UIPanGestureRecognizer) {
        let monkeyview = sender.view!
         
        switch sender.state {
        case.began, .changed :
            movingWithPan(view: monkeyview, sender: sender)
        case.ended:
            if monkeyview.frame.intersects(banana.frame){
                Monkey()
            }
//            else {
//                returnViewToOrigin(view: view)
//            }
        default:
            break
        }
    }
    func Monkey(){
            view.backgroundColor = #colorLiteral(red: 0.9962858558, green: 0.7961996198, blue: 0.9248743057, alpha: 1)
            lable.text = "Thank You ❤️"
            monkey.image=UIImage(named: "monkyeat")
            banana.image=UIImage(named: "pink")
    }
    func movingWithPan (view : UIView , sender : UIPanGestureRecognizer){
        let translation = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
//    func returnViewToOrigin (view : UIView){
//        UIView.animate(withDuration: 0.3, animations : {
//            self.view.frame.origin = self.monkeyViewRigon
//        })
//    }
}
