//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Jasneet Singh on 1/29/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    var randomBallNumber: Int = 0

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBallImage()
       
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateBallImage()
    }
    
    @IBAction func askButtonPressed(_ sender: Any) {
        
        updateBallImage()
    }
    
    
    func updateBallImage() {
        
        randomBallNumber = Int.random(in: 0...4)
        imageView.image = UIImage(named: ballArray[randomBallNumber])
        
        
    }


}

