//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by Badreah Saad on 15/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var cabel: UIImageView!
    @IBOutlet weak var phone: UIImageView!
    @IBOutlet weak var battrey: UIImageView!
    
    var cabelOrgin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPan(view: cabel)
        cabelOrgin = cabel.frame.origin
        view.bringSubviewToFront(cabel)
    }
    
    
    
    func addPan(view: UIView) {
        let panGestur = UIRotationGestureRecognizer(target: self, action: #selector(phoneCharged))
    }
    
    
    
    @IBAction func phoneCharged(_ sender: UIPanGestureRecognizer) {
        
        let phoneCabel = sender.view
        let translation = sender.translation(in: view)
        
        switch sender.state {
            
        case .began, .changed:
            cabel.center = CGPoint(x: cabel.center.x + translation.x, y: cabel.center.y + translation.y)
            //            sender.setTranslation(CGPoint.zero, in: view)
            
        case .ended:
            if cabel.frame.intersects(phone.frame) {
                self.battrey.image = UIImage(named: "FB")
            } else {
                self.cabel.frame.origin = self.cabelOrgin
            }
            
        default:
            break
        }
        
    }
    
    
    
    
}

