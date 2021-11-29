//
//  ViewController.swift
//  CoreDataTutoria
//
//  Created by Paweł Brzozowski on 29/11/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // refrence to the persisatnce container via AppDelgete. We are using ManageContex to acces CoreDatata
        (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    }


}

