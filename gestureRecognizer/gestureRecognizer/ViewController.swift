//
//  ViewController.swift
//  gestureRecognizer
//
//  Created by Ahmad MacBook on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {
    var index = 0
    var swipeArray = ["1","2","3"]
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mylabel: UILabel!
    
    @IBOutlet weak var gestureRecognizer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        let gstureRecognizer = UIGestureRecognizer(target: self, action: #selector(tapped))
        
        mylabel.addGestureRecognizer(gstureRecognizer)
        
    }
    
    @objc func tapped(){
        print("label tapped")
        view.backgroundColor = .red
    }

    @IBAction func tapppp(_ sender: Any) {
        tapped()
        
    }

    @IBAction func long(_ sender: UILongPressGestureRecognizer) {
        
        
        sender.minimumPressDuration = 3
    }
    
    @IBAction func gester(_ sender: UIPinchGestureRecognizer) {
        
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        
        if index >= swipeArray.count - 1 {
            print("out of range")
            index = 0
        }else{
            
            imageView.image = UIImage(named: swipeArray[index])
            index += 1
        }
        
        
    }
    
    
 
    @IBAction func rotation(_ gestureRecognizer: UIRotationGestureRecognizer) {
        
        guard gestureRecognizer.view != nil else { return }
              
         if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
            gestureRecognizer.view?.transform = gestureRecognizer.view!.transform.rotated(by: gestureRecognizer.rotation)
            gestureRecognizer.rotation = 0
         }}

    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
    
        let trans = sender.translation(in: view)
        
        sender.view?.center = CGPoint(x:
                (sender.view?.center.x)! + trans.x, y:
                (sender.view?.center.y)! + trans.y)
        
        sender.setTranslation(CGPoint.zero, in: view)
        
//        if ((sender.view?.center = CGPoint(x: 87, y: 550)) != nil){
//            
//            let alert = UIAlertController(title: "Alert", message: "hi", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
//            
//        }else{
//            
//        }
    }
    
    @IBOutlet weak var pin: UIImageView!

}
      

