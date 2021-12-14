//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Najla Talal on 12/14/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var birdImage: UIImageView!
    var bird: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: birdImage)
        bird = birdImage.frame.origin
        view.bringSubviewToFront(birdImage)
        label.font = UIFont(name: "GillSans-Italic", size: 20)
    }
    
    func addPanGesture(view: UIView) {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    // Refactor
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        let x = sender.view!
        
        switch sender.state {
            
        case .began, .changed:
            moveViewWithPan(view: x, sender: sender)

        case .ended:
            if x.frame.intersects(treeImage.frame) {
                deleteView(view: x)
                
            } else {
                returnViewToOrigin(view: x)
            }
            
        default:
            break
        }
    }
    
    
    func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        
        let translation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    
    func returnViewToOrigin(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            view.frame.origin = self.bird
        })
    }
    
    
    func deleteView(view: UIView) {
        
        UIView.animate(withDuration: 0.3, animations: {
            view.alpha = 0.0
        })
    }
    
}


