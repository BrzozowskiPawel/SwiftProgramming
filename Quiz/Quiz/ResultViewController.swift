//
//  ResultViewController.swift
//  Quiz
//
//  Created by Paweł Brzozowski on 18/11/2021.
//

import UIKit

protocol ResaultViewControllerProtocol{
    func dialogDismissed()
}
class ResultViewController: UIViewController {

    
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var dialogView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var feedbackLabel: UILabel!
    @IBOutlet weak var dissminsButton: UIButton!
    
    // This will be set from viewController
    var titleText = ""
    var feedbacktext = ""
    var buttonText = ""
    
    var delegate: ResaultViewControllerProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round the dialog box corners
        dialogView.layer.cornerRadius = 15
    }
     // We are using this because ViewDiDLoad fires only once!!!
    override func viewWillAppear(_ animated: Bool) {
        
        // setting values
        titleLabel.text = titleText
        feedbackLabel.text = feedbacktext
        dissminsButton.setTitle(buttonText, for: .normal)
        
        // Hide the uI elements
        dimView.alpha = 0
        titleLabel.alpha = 0
        feedbackLabel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Fade in the dim view
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.titleLabel.alpha = 1
            self.feedbackLabel.alpha = 1
        }, completion: nil)
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        // Fade out the dim view and then dismiss the popup
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.dimView.alpha = 0
        }) { completed in
            // Dismiss popup
            self.dismiss(animated: true, completion: nil)
            
            // DIsmiss delagte that popup was dismissed
            self.delegate?.dialogDismissed()
        }
        
    }
    
}
