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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        print("CAMERA TAPPED")
    }
    
}

