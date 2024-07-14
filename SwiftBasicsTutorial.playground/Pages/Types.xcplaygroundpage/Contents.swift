//: [Previous](@previous)

import Foundation

var possibleNumber = "123"

var convertedNumber = Int(possibleNumber)

let number = convertedNumber!

var shoppingList = ["Chocolate Cake", "Egg", "Flour"]

//let Chocolate = shoppingList.remove(at: 0)
//
//print(Chocolate)

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1). \(value)")
}

func addition(a : Int, b: Int) -> Int{
    return a + b
}

var ans = addition(a:1, b:3)

print(ans)

//if convertedNumber != nil {
//    print("the possible number might be a number")
//} else{
//    print("The number is some string of words")
//}

//: [Next](@next)
