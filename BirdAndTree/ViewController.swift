//
//  ViewController.swift
//  BirdAndTree
//
//  Created by Ebtesam Alahmari on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bird: UIImageView!
    @IBOutlet weak var tree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
       
        if bird.layer.position.x == tree.frame.size.height/2 {
            alert()
        }
      
    }
    
    func alert() {
        let alert = UIAlertController(title: "Alert", message: "bird in tree", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        present(alert, animated: true, completion: nil)
    }
}
