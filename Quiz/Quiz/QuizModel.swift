//
//  QuizModel.swift
//  Quiz
//
//  Created by Paweł Brzozowski on 15/11/2021.
//

import Foundation


protocol QuizProtocol {
    func questionsRetrieved(_ questions:[Question])
    
}

class QuizModel {
    
    // Something will be set as delegate of this class
    var delegate:QuizProtocol?
    
    // This will be done in background
    func getQuestions() {
        // TODO: Fetch the questions
        
        // Notify the delegate of the retrived questions
        delegate?.questionsRetrieved([Question]())
    }
}
