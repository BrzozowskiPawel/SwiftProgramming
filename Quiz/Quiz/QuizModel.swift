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
        getRemoteJsonFile()
        
        
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
        // get a URL object
        let urlString = "https://codewithchris.com/code/QuestionData.json"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("couldnt create URL object")
            return
        }
        
        // Get a URL Session objecy
        let session = URLSession.shared
        
        // Geta data task object
        let dataTask = session.dataTask(with: url!) { data, response, error in
            // Check that there wasnt any error
            if error == nil && data != nil {
                do {
                    
                    // Create a JSON Decoder object
                    let decoder = JSONDecoder()
                    
                    // Parse the JSON
                    let array = try decoder.decode([Question].self, from: data!)
                    
                    // USE the main thread to notify the view controller fo UI Work
                    
                    DispatchQueue.main.async {
                        // Notify the delagte (view controller)
                        // HAVE TO REMEBER THAT THIS IA A BACKGROUND THREAD! IT COULD TAKE A WHILE
                        self.delegate?.questionsRetrieved(array)
                    }
                    
                    
                } catch {
                    print("Couldnt parse a JSON: \(error)")
                }
                
                
            }
            
        }
        
        // Call resume on the data task, this will kick off that task
        dataTask.resume()
        
    }
}
