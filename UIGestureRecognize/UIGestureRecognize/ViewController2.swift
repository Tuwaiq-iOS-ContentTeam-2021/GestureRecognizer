//
//  ViewController2.swift
//  UIGestureRecognize
//
//  Created by nouf on 14/12/2021.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var circle: UIImageView!
    @IBOutlet weak var pin: UIImageView!
    var point = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    var initialCenter = CGPoint()
   
    @IBAction func panPiece(_ gestureRecognizer : UIPanGestureRecognizer) {
        guard gestureRecognizer.view != nil else {return}
        let piece = gestureRecognizer.view!
        // Get the changes in the X and Y directions relative to
        // the superview's coordinate space.
        let translation = gestureRecognizer.translation(in: piece.superview)
        if gestureRecognizer.state == .began {
           // Save the view's original position.
           self.initialCenter = piece.center
        }
           // Update the position for the .began, .changed, and .ended states
        if gestureRecognizer.state != .cancelled {
           // Add the X and Y translation to the view's original position.
           let newCenter = CGPoint(x: initialCenter.x + translation.x, y: initialCenter.y + translation.y)
            
           piece.center = newCenter
            if pin.frame.intersects(circle.frame) {
                circle.image = UIImage(systemName: "circle.fill")
        }
        } else {
           
           piece.center = initialCenter
        }
       
       
    }
  
}
