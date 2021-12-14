//
//  ViewController.swift
//  GusterRecognizer
//
//  Created by Areej Mohammad on 10/05/1443 AH.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    //===================
    @IBOutlet weak var imageBook: UIImageView!
    var books = ["character.book.closed.ar","books.vertical","book","book.closed"]
    var index = 0
    //=============
    @IBOutlet weak var rotationImage: UIImageView!
    //=============
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //=========================
    // Tap Guster Recognizer
    @IBAction func tapGestureRecgnizer(_ sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            sender.numberOfTapsRequired = 3
            alert()
        }
    }
    // Alert
    func alert(){
        let alert = UIAlertController(title: "alert", message: "photo tapped", preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    //========================
    // Long Press Guster Recognizer
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        sender.minimumPressDuration = 3
        print("image tapped for 3 seconds")
        alert()
    }
    //=========================
    // Pinch Guster Recognizer
    
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        sender.view?.transform = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale))!
        sender.scale = 1.0
    }
    //=====================
    //Swipe Guster Recognizer
    @IBAction func swipeGuster(_ sender: UISwipeGestureRecognizer) {
        if index > books.count - 1 {
            index = 0
        }
        imageBook.image = UIImage(systemName: books[index])
        index += 1
    }
    //=====================
    // Rotation Guster Recognizer
    @IBAction func rotationnGuster(_ sender: UIRotationGestureRecognizer) {
        guard sender.view != nil else {
            return
        }
        if sender.state == .began || sender.state == .changed{
            print("Rotation")
            sender.view?.transform = (sender.view?.transform.rotated(by: sender.rotation))!
            sender.rotation = 0
        }
    }
    //========================
    // Pan Guster Recognizer
    @IBAction func PanGuster(_ sender: UIPanGestureRecognizer) {
        let trans = sender.translation(in: view)
        sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
}
