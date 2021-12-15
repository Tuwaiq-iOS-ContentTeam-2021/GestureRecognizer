//
//  ViewController.swift
//  Games App
//
//  Created by loujain on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tree: UIImageView!
    
    @IBOutlet weak var bicycle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(
            x: (sender.view?.center.x)! + trans.x,
            y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        
        let actionAlert = UIPanGestureRecognizer(target: self, action: #selector(alert))
        bicycle.addGestureRecognizer(actionAlert)
        
        
        
    }
    
    
    
    @objc func alert (){
        let alert = UIAlertController(title: "Alert", message: "action wow", preferredStyle: .alert)
        let action = UIAlertAction(title: "go away", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
        
}

