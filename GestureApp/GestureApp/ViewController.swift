//
//  ViewController.swift
//  GestureApp
//
//  Created by TAGHREED on 11/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lablee: UILabel!
    @IBOutlet weak var purplePuzzle: UIImageView!
    
    @IBOutlet weak var bluePuzzle: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
            sender.setTranslation(CGPoint.zero, in: view)
            if sender.state == .ended {
            if sender.view!.frame.intersects(bluePuzzle.frame){
               
                lablee.text = "🎉You made it!🎉"
            }else{
                lablee.text = "complete the puzzle"
            }
        }

   }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //end
    
}

