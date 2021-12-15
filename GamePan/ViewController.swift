//
//  ViewController.swift
//  GamePan
//
//  Created by Nora on 10/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var monkeyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func panImage(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(
          x: (sender.view?.center.x)! + trans.x,
          y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        let alert = UIPanGestureRecognizer(target: self, action: #selector(alert))
        monkeyImage.addGestureRecognizer(alert)
  
}

    @objc func alert (){
      let alert = UIAlertController(title: "Alert", message: "I'm happy", preferredStyle: .alert)
      let action = UIAlertAction(title: "don't touch me, go away!", style: .default, handler: nil)
      alert.addAction(action)
      present(alert, animated: true,completion: nil)
    }


}
