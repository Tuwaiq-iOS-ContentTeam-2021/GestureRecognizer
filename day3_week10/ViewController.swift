//
//  ViewController.swift
//  day3_week10
//
//  Created by AlDanah Aldohayan on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var doTheWork: UIImageView!
    @IBOutlet weak var imageRotation: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var penArray = ["EdXGQguXgAA6VlX","1637396410976","1637134752465","1636423215538"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rotate = UIRotationGestureRecognizer(target: self, action:     #selector(rotationGesture(_:)))
        imageRotation.addGestureRecognizer(rotate)
        
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        myLabel.addGestureRecognizer(gestureRecognizer)
    }
    
//    @objc func tapped() {
//        print("Label Tapped")
//        myLabel.textColor = .blue
//        view.backgroundColor = .orange
//    }
    
    @IBAction func gestureRecognizer(_ sender: UITapGestureRecognizer) {
        
        if sender.state == .ended {
            sender.numberOfTapsRequired = 3
            alert()
        }
        
    }
    
    
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) {
        
        sender.minimumPressDuration = 3
        print("Long Pressed")
    }
    
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
    
    @IBAction func swipPhotos(_ sender: UISwipeGestureRecognizer) {
        
        if index > penArray.count - 1 {
            index = 0
        }
        imageView.image = UIImage(named: penArray[index])
        index += 1
    }
    
    
    @IBAction func rotationGesture(_ sender: UIRotationGestureRecognizer) {
        
        //        sender.rotation = 360.0
        print("rotation gesture is detected")
        var lastRotation: CGFloat = 0
        var BeginRotation = CGFloat()
        if sender.state == .began {
            print("rotation begin")
            sender.rotation = lastRotation
            BeginRotation = sender.rotation
        } else if sender.state == .changed {
            print("rotation changing")
            let newRotation = sender.rotation + BeginRotation
            sender.view?.transform = CGAffineTransform(rotationAngle: newRotation)
        } else if sender.state == .ended {
            print("rotation end")
            lastRotation = sender.rotation
        }
    }
    
    
    @IBAction func panGesture(_ sender: UIPanGestureRecognizer) {
        var trans = sender.translation(in: view)
        sender.view?.center = CGPoint(
            x: (sender.view?.center.x)! + trans.x,
            y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        // 1. You can move it anywhere
            let x = UIPanGestureRecognizer(target: self, action: #selector(panAction))
            doTheWork.addGestureRecognizer(x)
        
        // 2. After letting the image go and try to grap it it will give you alert. Wont be able to move it again in another place ;p
//        if doTheWork.frame == imageRotation.frame {
//            panAction()
//        }
    }
    
    @objc func panAction(){
        let alert = UIAlertController(title: "Alert", message: "You won't be able to move it ever AGAIN!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "whatever...", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func alert() {
        let alert = UIAlertController(title: "Alert", message: "The Photo Has Been Tapped 3 Times", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

