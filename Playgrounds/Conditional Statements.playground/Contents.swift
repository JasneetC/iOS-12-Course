import UIKit

func loveCalculator(yourName : String, theirName: String ) -> String {
    
    let loveScore = arc4random_uniform(101)
    //type is UINT32
    
    if loveScore > 80 {
        return "Your love score is \(loveScore). You love eachother like Kanye loves Kanye"
    }
    //              can't print UINT32 since return is set to string, must include it this way
      
    else if loveScore > 40 && loveScore < 80 {
        return "Your love score is \(loveScore). You go together like coke and mentos"
    }
    //if or else for one or another if more than third option add else if
        
    else{
        return "Your love score is \(loveScore). No love possible, you will be forever alone"
    }
}

print(loveCalculator(yourName: "JSC", theirName: "AKC"))


