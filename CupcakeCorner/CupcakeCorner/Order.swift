//
//  Order.swift
//  CupcakeCorner
//
//  Created by Rushikesh Dadas on 01/07/24.
//

import Foundation

@Observable
class Order : Codable {
    enum CodingKeys : String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _sprinklers = "sprinklers"
        case _name = "name"
        case _city = "city"
        case _zip = "zip"
        case _streetAddress = "streetAddress"
    }
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0;
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if(specialRequestEnabled == false){
                extraFrosting = false
                sprinklers = false 
            }
        }
    }
    
    var extraFrosting = false
    var sprinklers = false
    
    var name: String = ""
    var city : String = ""
    var streetAddress : String = ""
    var zip : String = ""
    
    var ischeckOutButtonEnabled : Bool {
        if(name.isEmpty || city.isEmpty || streetAddress.isEmpty || zip.isEmpty){
            return true
        }
        
        return false
    }
    
    var totalCost : Decimal {
        var totalCost = Decimal(quantity) * 3
        
        totalCost += Decimal(type) / 2
        
        if extraFrosting {
            totalCost += Decimal(quantity)
        }
        
        if sprinklers {
            totalCost += Decimal(quantity) / 2
        }
        
        return totalCost
    }
}
