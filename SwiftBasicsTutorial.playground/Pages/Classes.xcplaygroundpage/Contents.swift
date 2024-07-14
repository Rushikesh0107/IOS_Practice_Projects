//: [Previous](@previous)

import Foundation

/*
 Class are slow as they are stored in the Heap memory
 Every thread in the Iphone shares the Heap memory which raise the problem of resouse allocation
 Class are stored by the reference types
 The whole Class Object is Modified/updated in the Heap memory
 */

/*
 Struct are stored in the Stack memory
 Every Thread has there own Stack memory
 Which leads to faster operation speed
 Struct are stored by value types
 The Struct object is copied and mutated and then pasted in the Stack again
 */

class ScreenViewModel {
    let title : String
    var showButton : Bool
    
    // Same init as Struct, but Struct has implicit inits
    init(title: String, showButton: Bool) {
        self.title = title
        self.showButton = showButton
    }
    
    deinit{
        //runs ad the object is beign removed from the memory
        //struct do NOT have deinit
    }
    
    func hideButton() {
        showButton = false
    }
    
    func updateShowButton(newValue : Bool){
        showButton = newValue
    }
}

// NOTE:- the instance creted using the class constructer is constant "let" is used
// as the the object itself is not changing
//the data inside the object is changing
let screenView : ScreenViewModel = ScreenViewModel(title: "Home", showButton: true)

screenView.hideButton()

print(screenView.showButton)
screenView.updateShowButton(newValue: true)
print(screenView.showButton)
