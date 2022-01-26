//
//  ExamController.swift
//  MVC-Example
//
//  Created by Paweł Brzozowski on 20/01/2022.
//

import Foundation
import UIKit

class ExamController: UIViewController {
    
    @IBOutlet weak var questionView: QuestionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionView.questiontextLabel.text = "Is Earth round"
    }
}
