//
//  Question.swift
//  Quizzler
//
//  Created by Jasneet Singh on 2/5/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let answer : Bool
    //properties
    
    init(text: String, correctAnswer: Bool){
      
        questionText = text
        answer = correctAnswer
        //Events, initializer, create new question from class Question - we need to give it text for questionText and answer for correctAnswer
    }

    
}

