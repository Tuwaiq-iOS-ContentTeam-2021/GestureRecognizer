//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Um Talal 2030 on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var football: UIImageView!
    
    @IBOutlet weak var goal: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
    
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
       
        if football.frame.intersects(goal.frame)
        {
            alert()
        }
      
    }
    
    func alert() {
        let alert = UIAlertController(title: "Alert", message: "Glory is Blue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Sure", style: .default))
        present(alert, animated: true, completion: nil)
    }
}

