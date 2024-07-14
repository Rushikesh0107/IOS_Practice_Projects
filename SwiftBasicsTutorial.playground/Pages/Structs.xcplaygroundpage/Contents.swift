import Foundation

struct Quiz {
    let title : String
    let dateCreated : Date
    let isHard : Bool?
    
    init(title :String, dateCreated : Date?, isHard : Bool?){
        self.title = title
        self.dateCreated = dateCreated ?? .now
        self.isHard = isHard
    }
}

var myQuiz: Quiz = Quiz(title: "Quiz1", dateCreated: nil, isHard : true)

//print(myQuiz)



//---------------------------------------------------------------------------------------------------



// Immutable Struct means all Let consts
struct UserModel {
    let name : String
    let isPremium : Bool
}

//it can be mutated only by creating a new new object with the same name
// here the struct is mutated from the outside of the struct
var user1 : UserModel = UserModel(name: "Nick", isPremium: false)


func markIsPremium(){
    print(user1)
    user1 = UserModel(name: user1.name, isPremium: true)
    print(user1)
}

//markIsPremium()


//---------------------------------------------------------------------------------------------------

// this is mutable struct as var is used in the struct
struct UserModel2 {
    let name : String
    var isPremium : Bool
}

var user2 : UserModel2 = UserModel2(name: "User2", isPremium: false)

func markUserPremium(){
    print(user2)
    user2.isPremium = true
    print(user2)
}

//markUserPremium()


//---------------------------------------------------------------------------------------------------


// here also the the function is creating  a new object from the scratch but the object is made inside the struct which is more secure and controlled rather than changing the value from the outside
struct UserModel3 {
    let name: String
    let isPremium : Bool
    
    func markUserToPremium(newValue : Bool) -> UserModel3{
        return UserModel3(name: name, isPremium: newValue)
    }
}

var user3 : UserModel3 = UserModel3(name: "User3", isPremium: false)

//print(user3)

user3 = user3.markUserToPremium(newValue: true)

//print(user3)

//---------------------------------------------------------------------------------------------------


struct UserModel4 {
    let name: String
    private(set) var isPremium : Bool
    
    mutating func updateIsPremium(newValue: Bool) {
        return  isPremium = newValue
    }
}

var user4 : UserModel4 = UserModel4(name: "User4", isPremium: false)

print(user4)

user4.updateIsPremium(newValue: true)

print(user4)



