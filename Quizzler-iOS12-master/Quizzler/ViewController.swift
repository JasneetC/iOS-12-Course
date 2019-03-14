//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    //QuestionBank has no paramters so no need to have any here
    var pickedAnswer : Bool = false
    //setting variable for user input
    var questionNumber: Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       nextQuestion()
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        //True button has the tag of 1
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        //False button has the tag of 2
        }
        
        checkAnswer()
        //Calling checkanswer function that is further down
        questionNumber = questionNumber + 1
        //Moving onto question 2
        nextQuestion()
        
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber)
        
    }
    

    func nextQuestion() {
        if questionNumber <= 12 {
        questionLabel.text = allQuestions.list[questionNumber].questionText
        //updating the actual text for question, once it goes above 12 it is the end of quiz
        updateUI()
    }
        else {
            
            let alert = UIAlertController(title: "Congrats", message: "Quiz completed. Start Over?", preferredStyle: .alert)
            //alert for when quiz is over
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                //continuation of alert so you can restart quiz
                
                self.startOver()
                //calling func startover - if you see in use self.
                
            }
            
            alert.addAction(restartAction)
            //adds button to alert
            
            present(alert, animated: true, completion: nil)
            //animation and actual button
        }
    }
    
    
    func checkAnswer() {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        //calling array from QuestionGroup file, and then checking if answer input from user is correct
        
        if correctAnswer == pickedAnswer {
            print("You are Correct!")
            //checking answer
            score += 1
            ProgressHUD.showSuccess("Correct")
        }
        else {
            print("Incorrect")
            ProgressHUD.showError("Wrong")
        }
        
    }
    
    
    func startOver() {
       
        questionNumber = 0
        //resets question number after going through quiz and alertaction
        nextQuestion()
        //calls nextQuestion func to display the correct question and go through quiz again
        score = 0
        //reset score
        
        
    }
    

    

}
