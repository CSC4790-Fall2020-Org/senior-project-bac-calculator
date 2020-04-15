import Foundation

print("Enter Your Height")
let height = 60.0
print ("Enter your Age")
let age = 15.0
print ("Enter your Weight")
let weight = 3.0
print ("Enter Amount of Alchohol Consumed")
let amount = 5.0
print ("Enter Time in hours passed since drinking")
let time = 2.0
//time in hours
class BACFormula {
    let index : Double
    
    init() {
        index = 0
    }
    func WomCalc(amount: Int,weight: Int,time: Int)-> Double {
        index = ((amount * 5.14) / weight * 0.66)-.015 * time
        let womBAC = index
        return womBAC
    }
    func MenCalc(amount: Int, weight: Int, time: Int)-> Double {
        index = ((amount * 5.14) / weight * 0.73) - 0.015 * time
        let menBAC = index
        return menBAC
    }
    
    func Output(gender: String) {
    gender = "male"
    switch gender {
    case "male": print(menBAC)
    case "female": print(womBAC)
    default: print ("Please specify male or female")
    }
}
}