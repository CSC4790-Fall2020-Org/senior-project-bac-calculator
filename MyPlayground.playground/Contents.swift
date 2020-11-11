import UIKit
import Foundation

var userNum : Int
let compChouce = ["rock", "paper", "scissors"]
 
print("Enter Rock, Paper or Scissors\n")
if let response = readLine() {
    print("output :",response)
 } else {
    print("Nothing")
 }
let ans = readLine()

if ans == "Rock" || ans == "rock"{
    userNum = 1
}
else if ans == "Paper" || ans == "Paper"{
    userNum = 2
}
else if ans == "Rock" || ans == "rock"{
    userNum = 3
}

 
//print(compChouce[arc4random() % compChouce.count]);
