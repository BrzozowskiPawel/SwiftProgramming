//
//  Question.swift
//  Quiz
//
//  Created by Paweł Brzozowski on 15/11/2021.
//



import Foundation

// This need comfort to the codable protocol
struct Question: Codable {
    // Names of variable and types of variable should match with JSON.
    var question:String?
    var answers:[String]?
    var correctAnswerIndex:Int?
    var feedback:String?
    
}
