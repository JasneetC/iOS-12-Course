//
//  SecondViewController.swift
//  Segues
//
//  Created by Jasneet Singh on 2/27/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var textPassedOver : String?
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = textPassedOver
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
