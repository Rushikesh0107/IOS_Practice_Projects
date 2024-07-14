import Foundation


struct EmployeeModel : EmployeeHasName {
    let id : String
    let name : String
    let gender : String
}

print("hello")

protocol EmployeeHasName {
    var name : String {get}
}
