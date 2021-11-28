//
//  CameraViewController.swift
//  photoApp
//
//  Created by Paweł Brzozowski on 27/11/2021.
//

import UIKit

class CameraViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func savePhoto(image:UIImage) {
        // Call the photo servie to send
        PhotoService.savePhoto(image: image)
    }

}
