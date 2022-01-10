//
//  ViewController.swift
//  Dependency_Injection
//
//  Created by Paweł Brzozowski on 10/01/2022.
//


/*
 There will be 2 dependecies in this project:
 - responsible for interface
 - network type dependecny
 
 */
import APIKit
import UIKit
import MyAppUIKit

extension APICaller: DataFetchable {
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Create and set up button
        let button =  UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.setTitle("Tap me", for: .normal)
        button.center =  view.center
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }

    @objc private func didTapButton() {
        let vc =  CoursesViewController(dataFetchable: APICaller.shared)
        present(vc, animated: true, completion: nil)
    }

}

