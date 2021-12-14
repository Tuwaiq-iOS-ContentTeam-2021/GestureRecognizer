//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Mola on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myImage2: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            
        case .began, .changed:
            let trans = sender.translation(in: view)
            sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
            sender.setTranslation(CGPoint.zero, in: view)
        
        case .ended:
            if sender.view!.frame.intersects(myImage.frame){
                UIView.animate(withDuration: 0.3, animations: {
                    self.myImage2.alpha = 0.0
                })
                self.alert()
                myImage.image =  UIImage(named: "girlAndTeddyBear")
                myLabel.text = "You did a great job!"
            }
        default:
            break
        }

    }
    
    func alert() {
        let alert = UIAlertController(title: "Thanks !!", message: "Thank you for your help", preferredStyle: .alert)
        let action = UIAlertAction(title: "You're welcome", style: .default)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}









































