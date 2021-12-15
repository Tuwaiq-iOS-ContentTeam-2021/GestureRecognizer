//
//  ViewController2.swift
//  UIGesture
//
//  Created by Sahab Alharbi on 10/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bird: UIImageView!
    @IBOutlet weak var forest: UIImageView!
    var panGesture  = UIPanGestureRecognizer()
    override func viewDidLoad() {
        super.viewDidLoad()

        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragImg(_:)))

        bird.isUserInteractionEnabled = true
        bird.addGestureRecognizer(panGesture)
        
        

    }
    @objc func dragImg(_ sender:UIPanGestureRecognizer){
            let translation = sender.translation(in: self.view)
        
        switch sender.state {
        case .began, .changed:
            sender.view?.center = CGPoint(
                x: bird.center.x + translation.x,
                y: bird.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)

        case .ended:
            if bird.frame.intersects(forest.frame) {
                let alertController = UIAlertController(title: "YOU DID IT !!", message: "The bird has returned to the forest", preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                present(alertController, animated: true, completion: nil)
            }

        @unknown default:
            break
        }
        
        
     
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
