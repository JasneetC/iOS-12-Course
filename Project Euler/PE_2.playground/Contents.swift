/*
 Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:
 
 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
 
 By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
 */


import UIKit

var sum = 0
let limit = 4000000

var n1 = 0
var n2 = 1
var n3 = 1

while n1 < limit {

    n1 = n2 + n3
    //getting next fibonacci number

    n3 = n2
    n2 = n1
    //setting up variables to equal the right values in order to get fibonacci number
    
    if n2 % 2 == 0 {
        
        sum += n2
    }
}

print(sum)

