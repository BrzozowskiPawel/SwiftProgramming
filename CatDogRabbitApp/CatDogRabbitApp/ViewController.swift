//
//  ViewController.swift
//  CatDogRabbitApp
//
//  Created by Paweł Brzozowski on 04/01/2022.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageBackground: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setuup the image picker
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
    }
    
    // USE INCEPTIONv3
    func detect(image: CIImage) {
        // Using VIsion module performing PhotoDetection
    
        print("DETECTING")
        
        guard let model = try? VNCoreMLModel(for: DogCatRabbitImageClassifier().model) else {
            fatalError("Loading coreML failed")
        }
        
        let request = VNCoreMLRequest(model: model) { vnRequest, error in
            guard let results = vnRequest.results as? [VNClassificationObservation] else {
                fatalError("ERROR WITH REQUEST")
            }
            
            if let firstResults = results.first {
                print("RESULTS ->")
                print(firstResults)
                
            }
        }
        
        let handler = VNImageRequestHandler(ciImage: image)
        
        do {
            try handler.perform([request])
        } catch {
            print("ERROR WHILE PERFORMING CLASSIFICATION")
        }
        
    }
    
    
    // What happen when user finish taking/choosing a photot
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let userPickedImgae = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            // Set imagePicker's image to selescted photo
            imageBackground.image = userPickedImgae
            
            guard let ciiimage = CIImage(image: userPickedImgae) else {
                fatalError("Could not convert to CIImage")
            }
            detect(image: ciiimage)
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }

    // Function responsible for presenting imagePicker
    @IBAction func cameraButtonTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

