import UIKit

func bmiCalculator(weight : Double, height : Double) -> String {
    //need double for decimal, need string for return statement
    let bmi = weight / pow(height, 2)
    let bmiRounded = String(format: "%.2f", bmi)
    //rouding double
    var interperation = ""
    //used to set if/else to a var for return string
    
    if bmi > 25 {
        interperation = "You are overweight."
    }
    
    else if bmi < 25 && bmi > 18.5 {
        interperation = "You are normal weight."
    }
        
    else {
        interperation = "You are underweight."
    }
    
    return "Your BMI is \(bmiRounded) and \(interperation)"
    
}

var result = (bmiCalculator(weight: 106.6, height: 1.7))

print(result)
