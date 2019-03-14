//
//  ViewController.swift
//  Delegates and Protocols
//
//  Created by Jasneet Singh on 3/1/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CanReceive {
    //setting class to conform to protocol
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }


    @IBAction func sendButtonPressed(_ sender: Any) {
        
        performSegue(withIdentifier: "sendDataForwards", sender: self)
        //button set to method performSegue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //setting segue up for storyboard change
        if segue.identifier == "sendDataForwards" {
            //if statement for sendDataForwards segue
            
            let secondVC = segue.destination as! SecondViewController
            //creating setting secondVC to = the segue destination and letting xcode know destination is a ViewController
            
            secondVC.data = textField.text!
            //setting data variable from SecondViewcController to user input from textField
            
            secondVC.delegate = self
            //setting delegate of SecondViewController to First ViewController
            //What this means is, first ViewController will be the one to recieve that data and you can delegate it to it
            
        }
    }
    
    func dataReceived(data: String) {
        //conforms class to protocol
        
        label.text = data
        //display data from dataReceived method in Protocol
    }
    
}

