//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Jasneet Singh on 2/13/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String?
    
    override func drive() {
            super.drive()
        
        if let userSetDestination = destination {
           
            print("Driving to " + userSetDestination)
            
        }
    
        
    }
    
}
