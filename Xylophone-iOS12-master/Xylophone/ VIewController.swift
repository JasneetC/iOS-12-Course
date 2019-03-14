//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer: AVAudioPlayer!
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        playSound(soundFileName: soundArray[sender.tag - 1])
        //pulls the right sound file using the sound array and sender tag associated with button
        
    }
        
    func playSound(soundFileName : String) {
        //function to playsound, no inputs or outputs
        let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "wav")
        //locates/references sound file
        
        do {
            try audioPlayer =  AVAudioPlayer(contentsOf: soundURL!)
            //attempts to play audio file
        }
        catch {
            print(error)
            //catches and prints errors if audio can't be played
        }
        
        audioPlayer.play()
        //outputs audio
        
    }
}

