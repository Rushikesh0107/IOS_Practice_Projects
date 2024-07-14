import Foundation

var fruits : [String] = ["Oranges", "Apples", "Bananas", "Pineapple"]

// <#type> <= is called Generics
let myBools : Array<Bool> = [true, false, true, false, true, true]

let firstFruit = fruits.first
let lastFruit = fruits.last

//way to unwrap first and last object
//if let firstItem = fruits.first {
//    // first Item
//}


fruits.append(contentsOf: ["Custedapple", "Pear"])
let count = fruits.count
print(count)

struct ProductModel {
    let title : String
    let price : String
}

//this is an array of an custom data types
let ProdeuctArray = [
    ProductModel(title: "Item1", price: "123"),
    ProductModel(title: "Item2", price: "123"),
    ProductModel(title: "Item3", price: "123"),
    ProductModel(title: "Item4", price: "123"),
    ProductModel(title: "Item5", price: "123")
]

//print(ProdeuctArray)

if ProdeuctArray.indices.contains(3) {
    print(ProdeuctArray[3])
}


