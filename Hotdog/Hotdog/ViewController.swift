//
//  ViewController.swift
//  Hotdog
//
//  Created by Paweł Brzozowski on 03/01/2022.
//

import UIKit
import CoreML
import Vision


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    // Creating new object from class
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup imagePicker
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = false
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        print("CAMERA TAPPED")
    }
    
}

