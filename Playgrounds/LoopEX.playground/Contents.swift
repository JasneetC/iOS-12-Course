import UIKit


func waterSong(thisManyBottles numberBottles: Int) -> String {
    //input with 2 names = amount of bottles, string for output
    
    var lyrics: String = ""
    //lyrics set to string
    
    for number in (1...numberBottles).reversed(){
        //for loop with list for numbers of bottles set by input - using name 2
        let newLine: String = "\n\(number) bottles of water on the wall, \(number) bottles of water. \nTake one down and pass it around, \(number-1) bottles of water on the wall.\n"
        //constant set as string which is equaled to the return, string interpolation for number of bottles
        lyrics += newLine
        //setting lyrics equal/adding newLine
    }
    
    lyrics += "\nNo more bottles of water on the wall, no more bottles of water. \nGo to the store and buy some more, 99 bottles of water on the wall.\n"
    //adding the final line for when the loop finishes
    
    return lyrics
}

print(waterSong(thisManyBottles: 5))
//input for function - using name 1

