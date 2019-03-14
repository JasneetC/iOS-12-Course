//
//  ViewController.swift
//  Programmatic Layout - AutoLayout
//
//  Created by Jasneet Singh on 2/12/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let square = UIView(frame: CGRect( x: self.view.frame.width/2 - 50, y: self.view.frame.height/2 - 50, width: 100, height: 100))
        
        square.backgroundColor = UIColor.blue
        
        self.view.addSubview(square)
        
    }


}

