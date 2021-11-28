//
//  MainTabViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 28/11/2021.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // Detect wchich tab was tapped on
        if item.tag == 2 {
            // Camera tab was tapped on
            
            // Create an action sheet
            let actionSheet = UIAlertController(title: "Add a Photot", message: "Select a source", preferredStyle: .actionSheet)
            
            // return true or false if device support camera
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                
                // create and add the camera button
                let cameraButton = UIAlertAction(title: "Camera", style: .default) { action in
                    // Display the UIImagePickerController set to camera mode
                    self.showImagePickerController(mode: .camera)
                }
                actionSheet.addAction(cameraButton)
            }
            
            // only if library button is avalible
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                // create the photo liberary button
                let libraryButton = UIAlertAction(title: "Photo Library", style: .default) { action in
                    // Display the UIImagePickerController set to library mode
                    self.showImagePickerController(mode: .photoLibrary)
                }
                actionSheet.addAction(libraryButton)
            }
            
            // create and add cancel button
            let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            actionSheet.addAction(cancelButton)
            
            // Dipslay the action sheet
            present(actionSheet, animated: true, completion: nil)
        }
    }
    
    func showImagePickerController(mode: UIImagePickerController.SourceType) {
        // creteing and configuring the picker
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = mode
        imagePicker.delegate = self
        
        // presenting the image picker
        present(imagePicker, animated: true, completion: nil)
    }

}

extension MainTabViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Selecting only image (this tpe) not video
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        
        // Chech that selected imgae isn't nil
        if let selectedImage = selectedImage {
            
            // Get a refrence to the CameraVC
            let cameraVC = self.selectedViewController as? CameraViewController
            if let cameraVC = cameraVC {
                cameraVC.savePhoto(image: selectedImage)
            }
            
        }
        
        // Dismiss the image pciker
        dismiss(animated: true, completion: nil)
    }
    
    func goToFeed() {
        // Switch tab to the first one
        selectedIndex = 0
        
    }
}
