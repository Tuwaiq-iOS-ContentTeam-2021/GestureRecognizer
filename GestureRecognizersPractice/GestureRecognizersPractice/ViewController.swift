//
//  ViewController.swift
//  GestureRecognizersPractice
//
//  Created by Rayan Taj on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tapLabel: UILabel!
    @IBOutlet var swipLabel: UILabel!
    
    @IBOutlet var rotateImage: UIImageView!
    var swipeArr = ["1","2","3"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizers = UIGestureRecognizer(target: self, action: #selector(tapGestureRecognizersFunction))
        
        tapLabel.addGestureRecognizer(tapGestureRecognizers)
        tapLabel.isUserInteractionEnabled = true
    }
    
    @objc func tapGestureRecognizersFunction(){
        
//        tapLabel.text = "Tapped"
        print("tapped")
        view.backgroundColor = .red
        
    }
    
    
    
    @IBAction func imageTap(_ sender: Any) {
        print("tapped")
    }
    
    
    @IBAction func threeTaps(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            sender.numberOfTapsRequired = 3
            print("3 taps")
            
        }
    }



    @IBAction func threeSeconedsLongPress(_ sender: UILongPressGestureRecognizer) {
    
        sender.minimumPressDuration = 3
        print("3 seconeds long press")
        
    }
    

    
    @IBAction func pinch(_ sender: UIPinchGestureRecognizer) {
        sender.view!.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        
        sender.scale = 1.0
    }



    @IBAction func swipeAction(_ sender: UISwipeGestureRecognizer) {
        
        if index>swipeArr.count-1{
            index = 0
        }
            
        swipLabel.text = swipeArr[index]
        
        index += 1
    
    }
    

    @IBAction func rotate(_ sender: UIRotationGestureRecognizer) {
//        guard gestureRecognizer.view != nil else { return }
        
        guard sender.view != nil else { return }
             
        if sender.state == .began || sender.state == .changed {
            
            sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
            
            sender.rotation = 0
        }
        
    }
    
    
    
    @IBAction func panAction(_ sender: UIPanGestureRecognizer) {
        
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(
            x: sender.view!.center.x+trans.x,
            y: sender.view!.center.y+trans.y)
        
        
        sender.setTranslation(CGPoint.zero, in: view)
        
        
        print( trans.x ," : ", trans.y)
        
        
//        let trans2 = rotateImage.trans
//        print( rotateImage.layer.," : ", rotateImage.layer.frame.maxX)

        
        
    }
    
    

}

