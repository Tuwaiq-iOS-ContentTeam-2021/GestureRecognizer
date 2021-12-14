//
//  ViewController.swift
//  Game
//
//  Created by Lola M on 12/14/21.
//

import UIKit

class ViewController: UIViewController {

    var ballOrigin: CGPoint!
    var goals = 0
    
    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var ballImageView: UIImageView!
    @IBOutlet weak var goalsL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basketImageView.image = UIImage(named: "basket")
        ballImageView.image = UIImage(named: "ball")
        
        ballOrigin = ballImageView.frame.origin
    }


    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {

        let trans = sender.translation(in: view)
//        sender.view?.center = CGPoint(x: (sender.view?.center.x)!+trans.x, y: (sender.view?.center.y)!+trans.y)
//        sender.setTranslation(CGPoint.zero, in: view)
        
        switch sender.state {
        case .began, .changed:
            ballImageView.center = CGPoint(x: ballImageView.center.x + trans.x, y: ballImageView.center.y + trans.y)
            sender.setTranslation(CGPoint.zero, in: view)
        case .ended:
            if ballImageView.frame.intersects(basketImageView.frame) {
                goalsL.text = String(goals)
                goals+=1
            }
            
            
//        case .failed:
//            print("Faild")
        @unknown default:
            print("Invalid")
        }
        
    }
}

