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

// Delgate - Protocol pattern, here this class slave and QuizModel is master.
import UIKit

// Adding QuizProtocol to this class, coz delagte requiares it
class ViewController: UIViewController, QuizProtocol, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    // We need to add: UITableViewDelegate and UITableViewDataSource
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    var numCorrect = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set self as the delgate and datasource for the tableView
        tableView.delegate = self
        tableView.dataSource = self
        
        // TableViw row sizes:
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        // Seting model (QuizModel) delegate as this class.
        model.delegate = self
        
        model.getQuestions()
    }
    func displayQuestion() {
        // Chech if there are questions and chech that currentQuestion is not out of bounds
        
        guard questions.count > 0 && currentQuestionIndex < questions.count else {
            return
        }
        
        // Display the question text
        questionLabel.text = questions[currentQuestionIndex].question
        
        // Reload the tableView
        tableView.reloadData() 
    }
    // MARK: - QuizProtocool Methods
    
    func questionsRetrieved(_ questions: [Question]) {
        print("Questions retrieved from model!")
        // Get a reference to the questions
        self.questions = questions
        
        // Dispaly first question
        displayQuestion()
    }
    
    // MARK: - UITableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Make sure thaht the question contains at least a question
        guard questions.count > 0 else {
            print("OH NO :( there is no questions! Array doesnt cointain any question.")
            return 0
        }
        
        // Return the number of answers
        let currentQuestion =  questions[currentQuestionIndex]
        
        if currentQuestion.answers != nil {
            return currentQuestion.answers!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        
        // Customize cell - it return UIelement? we need to cast it inot UILabel
        let label = cell.viewWithTag(1) as? UILabel
        if label != nil {
            let question = questions[currentQuestionIndex]
            
            if question.answers != nil && indexPath.row < question.answers!.count{
                // Set the answet text for label
                label?.text = question.answers![indexPath.row]
            }
            
        }
        // Return the cell
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // User has tapped on row, chech if its the right answer
        
         let question = questions[currentQuestionIndex]
        
        if question.correctAnswerIndex ==  indexPath.row{
            // user got it right
            print("User got it right 😁")
        } else {
            // user hot it wrong
            print("User got it wrong 😿")
        }
        
        // Increment currentQuestionIndex
        currentQuestionIndex += 1
        
        // Dipslay next question
        displayQuestion()
    }
    
}

