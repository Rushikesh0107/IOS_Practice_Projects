import Foundation

struct DatabaseUser {
    let name: String
    let isPremium : Bool
    let order : Int
}

let allUser : [DatabaseUser] = [
    DatabaseUser(name: "Rushi", isPremium: true, order: 1),
    DatabaseUser(name: "Ravi", isPremium: false, order: 120),
    DatabaseUser(name: "Rakesh", isPremium: true, order: 149),
    DatabaseUser(name: "Rajnish", isPremium: false, order: 15),
]

//short hand way
let onlyPremium : [DatabaseUser] = allUser.filter({$0.isPremium})

let onlyPremiumUsers : [DatabaseUser] = allUser.filter { user in
    return user.isPremium
}

//more expanded way
let onlyPremiumUsersBhai : [DatabaseUser] = allUser.filter { user in
    if user.isPremium {
        return true
    } else {
        return false
    }
}

//print(onlyPremiumUsersBhai)

// ----------------------------------SORTING----------------------------------------------


let allUsersInSortedOrder1 = allUser.sorted { user1 , user2 in
    return user1.order < user2.order
}

let allUserInSortedOrder2 = allUser.sorted(by: {$0.order < $1.order})

//print(allUserInSortedOrder2)


//  ----------------------------------MAPPING----------------------------------------------

let namesOfTheUser : [String] = allUser.map { user in
    return user.name
}

let namesOfTheUser2 : [String] = allUser.map( { $0.name } )

print(namesOfTheUser2)
