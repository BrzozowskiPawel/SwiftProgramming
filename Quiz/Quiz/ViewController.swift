//
//  ViewController.swift
//  Quiz
//
//  Created by Paweł Brzozowski on 15/11/2021.
//

// This is how it works:
// 1. ViewController sets itself as delagte of QuizModel
// 2. getQuestions() is called on model (QuizModel() )
// 3. Inside of QuizModel getQuestion() is being activated
// 4. Beacuse QuizModel hav set QuizProtocol as it's delegate func questionRetirieved() from protocol is being started
// 5. questionsRetrived of the viewController is being called
import UIKit

// Adding QuizProtocol to this class, coz delagte requiares it
class ViewController: UIViewController, QuizProtocol {
    
    

    var model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Seting model (QuizModel) delegate as this class.
        model.delegate = self
        
        model.getQuestions()
    }
    
    // MARK: - QuizProtocool Methods
    
    func questionsRetrieved(_ questions: [Question]) {
        print("Questions retrieved from model!")
    }
}

