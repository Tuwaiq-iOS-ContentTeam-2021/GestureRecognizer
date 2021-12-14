//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by WjdanMo on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var coffeeShop: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imageViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addPanGesture(view: imageView)
        imageViewOrigin = imageView.frame.origin
        view.bringSubviewToFront(imageView)
        
    }
    
    func addPanGesture(view : UIView){
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        view.addGestureRecognizer(pan)
        
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer){
        
        let myImageView = sender.view!
        
        
        switch sender.state{
            
        case .began , .changed:
            moveView(view: myImageView, sender: sender)
            
        case .ended :
            if imageView.frame.intersects(coffeeShop.frame){
                changeImage(view: imageView)
            }
            
        default:
            break
            
        }
    }
    
    func moveView(view: UIView, sender: UIPanGestureRecognizer){
        
        let transation = sender.translation(in: view)
        
        view.center = CGPoint(x: view.center.x + transation.x
                              , y: view.center.y + transation.y)
        
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    func changeImage(view: UIImageView){
        view.image = UIImage(named: "afterCoffee")
    }
    
}
