//
//  ViewController.swift
//  GestureRecgizer
//
//  Created by esho on 10/05/1443 AH.
//

import UIKit
import Lottie
class ViewController: UIViewController {

    @IBOutlet weak var lableli: UILabel!
    @IBOutlet weak var redrose: UIImageView!
    
    @IBOutlet weak var baskitimage: UIImageView!
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animationView.frame = CGRect(x: 0, y: 20 , width: 450, height: 450)
        //        animationView.frame = view.bounds
        animationView.animation = Animation.named("clapping-hands")
        animationView.contentMode = .scaleAspectFit
        animationView.play()
        animationView.loopMode = .loop
        

    }


    
    @IBAction func panActt(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x:
        (sender.view?.center.x)! + trans.x, y:
        (sender.view?.center.y)! + trans.y)
        sender .setTranslation(CGPoint.zero, in: view)
        if redrose.frame.intersects(baskitimage.frame) {
            view.addSubview(animationView)
            lableli.text = "Good job"
            lableli.font = .systemFont(ofSize: 55)
            
           
            
        }
    }
    
        
    }
    
    

