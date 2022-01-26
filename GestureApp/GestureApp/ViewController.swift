//
//  ViewController.swift
//  GestureApp
//
//  Created by Paweł Brzozowski on 26/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fileImage: UIImageView!
    @IBOutlet weak var trashImage: UIImageView!
    
    var fileViewOrigin: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Add gesture to the fielImage
        addPanGesture(view: fileImage)
        
        // Set up inital vale for file's cords
        fileViewOrigin = fileImage.frame.origin
    }

    func addPanGesture(view: UIView) {
        // Creat a gesture recognizer called pan
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ViewController.handlePan(sender:)))
        // Add gesture recognizer to the view
        view.addGestureRecognizer(pan)
        
        // Bring a subview to the forn
        view.bringSubviewToFront(fileImage)
    }

    // Handle draging
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        // Sender is a fileImage
        let fileView = sender.view!
        
        switch sender.state {
            
        // Started dragging
        case .began, .changed:
            moveViewWithPan(view: fileView, sender: sender)
            
        // End dragging
        case .ended:
            // Check if file is intersecting a trash
            if fileView.frame.intersects(trashImage.frame) {
                animateDeleting(UIViewObj: fileImage)
            } else {
                // Place it back if it not a trash
                returnViewToOrigin(UIviewObj: fileImage)
            }
            
        default:
            break
        }
    }
    
    // View is file that is being moved, PanGestureRecongizer handle the movement
    private func moveViewWithPan(view: UIView, sender: UIPanGestureRecognizer) {
        
        // Interprets the pan gesture in the coordinate system of the specified view.
        // Basicaly this is tracking a location and velocity of gesture in the main view.
        let translation = sender.translation(in: view)
        
        // In each case add translation on x and y
        view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: view)
    }
    
    // Animate deleting -> changing alfa value to make it invisible
    private func animateDeleting(UIViewObj: UIView) {
        UIView.animate(withDuration: 0.3) {
            UIViewObj.alpha = 0.0
        }
    }
    
    // Animate returning to origin cords -> change x,y cord to orignin cords.
    private func returnViewToOrigin(UIviewObj: UIView) {
        UIView.animate(withDuration: 0.3) {
            UIviewObj.frame.origin = self.fileViewOrigin
        }
    }
}

