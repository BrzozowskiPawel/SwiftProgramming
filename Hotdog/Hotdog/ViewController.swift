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
//        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
    }
    
    // Delegate methods - set imageView ("background" of app) to the selected photot
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let userPickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            // Set imageView image to phohot
            imageView.image = userPickedImage
            
            // Change image to CIIMAGE
            guard let ciimage = CIImage(image: userPickedImage)  else {
                fatalError("Could not convert to CIImage")
            }
            
            detect(image: ciimage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        
    }
    
    // USE INCEPTIONv3
    func detect(image: CIImage) {
        // Using VIsion module performing PhotoDetection
        guard let model = try? VNCoreMLModel(for: Inceptionv3().model) else {
            fatalError("Loading coreML failed")
        }
        
        let request = VNCoreMLRequest(model: model) { vnRequest, error in
            guard let results = vnRequest.results as? [VNClassificationObservation] else {
                fatalError("ERROR WITH REQUEST")
            }
            
            if let firstResults = results.first {
                if firstResults.identifier.contains("hotdog") {
                    self.navigationItem.title = "HOTDOG 🌭"
                }
                else {
                    self.navigationItem.title = "NOT HOTDOG 😭"
                }
                
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print("ERROR WHILE PERFORMING CLASSIFICATION")
        }

    }
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        // As imagePicker is A VC, to show it use present
        present(imagePicker, animated: true, completion: nil)
    }
    
}

