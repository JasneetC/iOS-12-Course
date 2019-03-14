import UIKit

func bmiCalculator(weight : Double, height : Double) -> String {
    
    let bmi = (weight * 0.45) / pow( (height * 0.35), 2)
    let bmiRounded = String(format: "%.", bmi)
    var returns = " "
    
    if bmi > 25 {
        returns = "You are overweight."
    }
    else if bmi < 25 && 19 > bmi {
        returns = "You are normal weight."
    }
    else {
        returns = "You are underweight."
    }
    
        return "Your BMI is \(bmiRounded) and \(returns)"
}

var result = bmiCalculator(weight: 234.5, height: 67)
print(result)
