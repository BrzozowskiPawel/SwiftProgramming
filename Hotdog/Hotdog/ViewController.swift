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
//        imagePicker.sourceType = .camera
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    // Delegate methods - set imageView ("background" of app) to the selected photot
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Set imageView image to phohot
            imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        // As imagePicker is A VC, to show it use present
        present(imagePicker, animated: true, completion: nil)
    }
    
}

