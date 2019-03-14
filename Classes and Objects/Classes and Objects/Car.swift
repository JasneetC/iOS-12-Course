//
//  Car.swift
//  Classes and Objects
//
//  Created by Jasneet Singh on 2/13/19.
//  Copyright © 2019 Jasneet Singh. All rights reserved.
//

import Foundation

enum CarType {
    //creating and setting Enum
    case Sedan
    case Coupe
    case Hatchback
}

class Car {
    
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    //Using Enum
 
    init() {
        
    }
    
    //Initializer
    convenience init (customerChosenColor : String) {
        self.init()
        color = customerChosenColor
    }
    
    
    func drive() {
        print("Car is moving")
    }
    
}
