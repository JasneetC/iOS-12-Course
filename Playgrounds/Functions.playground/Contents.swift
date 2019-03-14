//
//func getMilk() {
//
//    print("go to store")
//    print("buy 2 cartons of milk")
//    print("pay $2")
//    print("come home")
//
//}

//func getMilk(howManyMilkCartons : Int){
//            //input
//        print("go to store")
//        print("buy \(howManyMilkCartons) cartons of milk")
//                    //input from when getMilk is called
//        let priceToPay = 2 * howManyMilkCartons
//            //calculate cost of cartons based off of when getMilk is called
//        print("pay $\(priceToPay)")
//        print("come home")
//
//}

func getMilk(howManyMilkCartons : Int, howMuchMoneyGiven : Int) -> Int {
            //input                                             output
        print("go to store")
        print("buy \(howManyMilkCartons) cartons of milk")
                    //input from when getMilk is called
        let priceToPay = 2 * howManyMilkCartons
            //calculate cost of cartons based off of when getMilk is called
        print("pay $\(priceToPay)")
        print("come home")
    
        let change = howMuchMoneyGiven - priceToPay
            //calculate change
    
        return change
        //must have return
}

var amountOfChange = getMilk(howManyMilkCartons: 4, howMuchMoneyGiven: 10)
//variable to print return from function         input

print("Hello here is your $\(amountOfChange) change")
