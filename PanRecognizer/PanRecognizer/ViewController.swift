//
//  ViewController.swift
//  PanRecognizer
//
//  Created by Abdullah Alnutayfi on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var folder: UIImageView!
    @IBOutlet weak var rec: UIImageView!
    var folderPosition: CGPoint!
    override func viewDidLoad() {
        super.viewDidLoad()
        folderPosition = folder.frame.origin
        view.bringSubviewToFront(folder)
        rec.translatesAutoresizingMaskIntoConstraints = false
        rec.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
      
        rec.heightAnchor.constraint(equalToConstant: 200).isActive = true
        rec.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        folder.translatesAutoresizingMaskIntoConstraints = false
        folder.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        folder.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        folder.heightAnchor.constraint(equalToConstant: 200).isActive = true
        folder.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }

    @IBAction func move(_ sender: UIPanGestureRecognizer) {
 

        let folderView = sender.view!
        switch sender.state {
            case .began, .changed:
                let trans = sender.translation(in: view)
                sender.view?.center = CGPoint(x: (sender.view?.center.x)! + trans.x, y: (sender.view?.center.y)! + trans.y)
                sender.setTranslation(CGPoint.zero, in: view)


            case .ended:
                if folderView.frame.intersects(rec.frame) {
                    folder.removeFromSuperview()
                    let alert = UIAlertController(title: "", message: "Folder has been deleted successfully!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    view.frame.origin = self.folderPosition
                }
                
            default:
                break
        }
}
    
}

