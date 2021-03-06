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
class ViewController: UIViewController, QuizProtocol, UITableViewDelegate, UITableViewDataSource, ResaultViewControllerProtocol {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    // We need to add: UITableViewDelegate and UITableViewDataSource
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var stackViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var stackViewTrailingConstraint: NSLayoutConstraint!
    
    var model = QuizModel()
    var questions = [Question]()
    var currentQuestionIndex = 0
    var numCorrect = 0
    
    var resaultDialog: ResultViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Initialzie the result dialog from the Storyboard blueprints
        resaultDialog = storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultViewController
        resaultDialog?.modalPresentationStyle = .overCurrentContext
        resaultDialog?.delegate = self
        
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
        
        // Check if we should restore the state before showing question 1
        let savedIndex = StateManager.retrieveValue(key: StateManager.questionIndexKey) as? Int
        
        if savedIndex != nil && savedIndex! < self.questions.count {
            // Set the current question to saved index
            currentQuestionIndex = savedIndex!
            
            // Retriev number od correct from storage
            let savedNumCorrect = StateManager.retrieveValue(key: StateManager.numCorrectKey) as? Int
            
            if savedNumCorrect != nil {
                numCorrect = savedNumCorrect!
            }
            print("Question index should be loaded from UserDefaults: savedIndex \(savedIndex!), savedNumCorrect: \(savedNumCorrect!)")
        }
        
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
        
        var titleText = ""
        let question = questions[currentQuestionIndex]
        
        if question.correctAnswerIndex ==  indexPath.row{
            // user got it right
            titleText = "Correct 🏆"
            numCorrect += 1
            print("User got it right 😁")
        } else {
            // user hot it wrong
            titleText = "Wrong 😵‍💫"
            print("User got it wrong 😿")
        }
        
        // Show the popup
        if resaultDialog != nil{
            
            // Customize the dialog text
            resaultDialog!.titleText = titleText
            resaultDialog!.feedbacktext = question.feedback!
            resaultDialog!.buttonText = "Next"
            
            // Make sure that this will be done on main thread
            DispatchQueue.main.async {
                self.present(self.resaultDialog!, animated: true, completion: nil)
            }
            
        }
    }
    
    // MARK: - ResultViewControllerProtocol Methods
    
    func dialogDismissed() {
        // Increment currentQuestionIndex
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            // User has just answered the las question
            // SHow a summary dialog
            
            // Show the popup
            if resaultDialog != nil{
                
                // Customize the dialog text
                resaultDialog!.titleText = "Summary 👀"
                resaultDialog!.feedbacktext = "You got \(numCorrect) correct out of \(questions.count) questions"
                resaultDialog!.buttonText = "Restart"
                
                present(resaultDialog!, animated: true, completion: nil)
                
                StateManager.clearState()
            }
        }
        else if currentQuestionIndex > questions.count {
            // Restart
            numCorrect = 0
            currentQuestionIndex = 0
            displayQuestion()
        }
        else if currentQuestionIndex < questions.count {
            // We have more question to show
            
            //Dipslay next question
            displayQuestion()
            
            // Save state
            StateManager.saveState(numCorrect: numCorrect, questionIndex: currentQuestionIndex)
            print("contex saved")
        }
    }
}

