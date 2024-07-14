import Foundation

struct carInfo {
    let Brand : carBrand
    let model : String
}


enum carBrand {
    case ford, toyota, honda
    
    var title  : String {
        switch self {
        case .ford :
            return "Ford"
        case .toyota :
            return "Toyota"
        case .honda :
            return "Honda"
        }
    }
}

var c1 : carInfo = carInfo(Brand: .ford, model: "Focus")
var c2 : carInfo = carInfo(Brand: .ford, model: "Fiesta")
var c3 : carInfo = carInfo(Brand: .toyota, model: "Supra")

var car1 : carBrand = .ford
print(car1.title)


