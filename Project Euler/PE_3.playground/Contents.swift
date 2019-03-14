/*
 The prime factors of 13195 are 5, 7, 13 and 29.
 
 What is the largest prime factor of the number 600851475143 ?
*/
import UIKit

var p = 600851475143
var f = 2

while f < p {
    if (p % f == 0) {
        
        p = p / f
        
    } else {
        f = f + 1
    }
}
print(f)
