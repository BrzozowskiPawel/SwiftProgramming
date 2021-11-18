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
    }

    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        // Dismiss popup
        self.dismiss(animated: true, completion: nil)
        
        // DIsmiss delagte that popup was dismissed
        delegate?.dialogDismissed()
    }
    
}
