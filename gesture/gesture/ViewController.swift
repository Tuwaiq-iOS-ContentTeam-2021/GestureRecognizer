//
//  ViewController.swift
//  gesture
//
//  Created by Sahab Alharbi on 10/05/1443 AH.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    var rotationGesture = UIRotationGestureRecognizer()

    
    @IBOutlet weak var tree: UIImageView!
    var panGesture  = UIPanGestureRecognizer()
    @IBOutlet weak var labelt: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //pan gesture for dragging an image
//        panGesture = UIPanGestureRecognizer(target: self, action: #selector(dragImg(_:)))
//        tree.isUserInteractionEnabled = true
//        tree.addGestureRecognizer(panGesture)
//
//        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchRecoginze(_:)))
//              pinchGesture.delegate = self
//
//        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        labelt.addGestureRecognizer(gesture)
       
        
//        rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(self.rotationGestureHandler))
//           let rotate = UIRotationGestureRecognizer(target: self, action:     #selector(rotationGestureHandler(_:)))
          
    }
//
//    @objc func dragImg(_ sender:UIPanGestureRecognizer){
//            let translation = sender.translation(in: self.view)
//        sender.view?.center = CGPoint(x: tree.center.x + translation.x, y: tree.center.y + translation.y)
//            sender.setTranslation(CGPoint.zero, in: self.view)
//
//    }
        
//    @IBAction func actionB(_ gestureRecognizer : UIPinchGestureRecognizer) {   guard gestureRecognizer.view != nil else { return }
//
//        if gestureRecognizer.state == .began || gestureRecognizer.state == .changed {
//           gestureRecognizer.view?.transform = (gestureRecognizer.view?.transform.scaledBy(x: gestureRecognizer.scale, y: gestureRecognizer.scale))!
//           gestureRecognizer.scale = 1.0
//        }}
    
        
        
        
//    @objc func pinchRecoginze(_ pinchGesture: UIPinchGestureRecognizer) {
//
//        guard pinchGesture.view != nil else {return}
//
//        let view = pinchGesture.view!
//        let location = pinchGesture.location(in: view.superview)
//        view.center = location
//     }
//
        
        

//    @IBAction func gesturereco(_ sender: Any) {
        
//    }
//    @objc func tapped() {
////        view.backgroundColor = .brown
//    }
//    func alert() {
//        let alert = UIAlertController(title: "Alert", message: "Photo tapped", preferredStyle: <#T##UIAlertController.Style#>)
//        let action = UIAlertAction(title: "", style: .default, handler: <#T##((UIAlertAction) -> Void)?##((UIAlertAction) -> Void)?##(UIAlertAction) -> Void#>)
        
//    }
    
    
//    @IBAction func longpress(_ sender: Any) {
//
//    }
//    @objc func rotationGestureHandler(recognizer:UIRotationGestureRecognizer){
//        if let view = recognizer.view {
//            view.transform = view.transform.rotated(by: recognizer.rotation)
//            recognizer.rotation = 1.0
//        }
//    }

//    @IBAction func rotation(_ sender: UIRotationGestureRecognizer) {
//        if sender.state == .began {
//               print("begin")
//           } else if sender.state == .changed {
//               print("changing")
//           } else if sender.state == .ended {
//               print("end")
//           }
//    }
    
}


