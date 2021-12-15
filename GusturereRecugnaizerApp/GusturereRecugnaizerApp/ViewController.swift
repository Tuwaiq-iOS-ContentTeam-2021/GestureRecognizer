//
//  ViewController.swift
//  GusturereRecugnaizerApp
//
//  Created by Wejdan Alkhaldi on 10/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var message1: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var dog: UIImageView!
    @IBOutlet weak var house: UIImageView!
    var dogvieworigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPanGusture(view: dog)
        
        
    }
    func addPanGusture(view: UIView){
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.panhandle(sender:)))
        view.addGestureRecognizer(pan)
        
    }
    @objc func panhandle(sender: UIPanGestureRecognizer){
        let dogview = sender.view!
        switch sender.state {
            
        case .began, .changed:
            moveeViewWithPan(view: dogview, sender: sender)
        case .ended:
            if dogview.frame.intersects(house.frame) {
                deleteView(view: dogview)
                message.text = " Thank You my friend 🥺❤️ >"
                message1.text = ""
            }
            
        default:
            break
            
        }
    }
    
    func moveeViewWithPan(view:UIView, sender:UIPanGestureRecognizer){
        let trans = sender.translation(in: view)
        view.center = CGPoint(x: view.center.x + trans.x, y:view.center.y + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        
    }
    
    func deleteView(view:UIView){
        UIView.animate(withDuration: 0.3, animations: {
            view.alpha = 0.0
        })
    }
}

