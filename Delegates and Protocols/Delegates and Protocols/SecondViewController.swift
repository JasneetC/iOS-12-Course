//
//  SecondViewController.swift
//  Delegates and Protocols
//
//  Created by Jasneet Singh on 3/1/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

protocol CanReceive {
    
    func dataReceived(data: String)
    
}

class SecondViewController: UIViewController {
    
    var delegate : CanReceive?
    //setting delegate CanReceive - it is an optional

    var data = ""
    //setting variable data to an empty string so it can be used for input of textField from firstViewCon
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = data
        //setting label of SecondVC to display data that was inputted on firstVC
        
    }
    
    @IBAction func sendDataBack(_ sender: Any) {
        
        delegate?.dataReceived(data: textField.text!)
        //setting button to trigger data to send to delegate, if it is not nil
        dismiss(animated: true, completion: nil)
    
    }


}
