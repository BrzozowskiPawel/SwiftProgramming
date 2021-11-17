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
    
    func getQuestions() {
        // Fetch the questions
        getLocalJsonFile()
        
        
    }
    
    func getLocalJsonFile() {
        // Get budle path to JSON file
        let path = Bundle.main.path(forResource: "QuestionData", ofType: "json")
        
        // Double check that path isn't nil
        guard path != nil else {
            print("Couldnt find the JSON data file")
            return
        }
        
        // Create URL object from the path
        let url = URL(fileURLWithPath: path!)
        
        // Get data from URL
        do {
            let data = try Data(contentsOf: url)
            
            // Decoding a data into a object
            let decoder = JSONDecoder()
            // [Question].self -> this will gives us a type of object
            let array = try decoder.decode([Question].self, from: data)
            
            // Notify delegate
            delegate?.questionsRetrieved(array)
        } catch {
            print("Couldnt read the data from ulr \(url)")
        }
        
    }
    
    func getRemoteJsonFile() {
        
    }
}
