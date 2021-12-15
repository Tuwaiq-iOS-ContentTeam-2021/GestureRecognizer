//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by mac on 14/12/2021.
//




import UIKit

class ViewController: UIViewController {
    @IBOutlet var rotationGesture: UIRotationGestureRecognizer!
    
    @IBOutlet weak var myLable: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    var index = 0
    var arrImages: [String] = ["Riyadh","Jeddah","Mecca"]
    override func viewDidLoad() {
        super.viewDidLoad()
//        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        myLable.addGestureRecognizer(gestureRecognizer)
    }
    
//    @objc func tapped() {
//        print("label tapped")
//    }
    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            sender.numberOfTapsRequired = 3
            alert()
        }
    }
    
    @IBAction func longPressGestureRecognizer(_ sender: UILongPressGestureRecognizer) {
        sender.minimumPressDuration = 10
//        print("image tapped for 1 second")
        alert()
    }
    
    @IBAction func pinchGestureRecognizer(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    
    @IBAction func swipeGestureRecognizer(_ sender: UISwipeGestureRecognizer) {
        sender.direction = .left
        if index > arrImages.count - 1 {
            index = 0
        }else{
            myImage.image = UIImage(named: arrImages[index])
            index += 1
        }
    }
    
    @IBAction func rotationGestureRecognizer(_ sender: UIRotationGestureRecognizer) {
        guard let gestureview = rotationGesture.view else {
            return
        }
        gestureview.transform = gestureview.transform.rotated(by: rotationGesture.rotation)
        rotationGesture.rotation = 0
        
    }
    
    @IBAction func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
        print(trans)
    }
    
    
    func alert() {
        let alert = UIAlertController(title: "Alert", message: "photoTapped", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }


}

