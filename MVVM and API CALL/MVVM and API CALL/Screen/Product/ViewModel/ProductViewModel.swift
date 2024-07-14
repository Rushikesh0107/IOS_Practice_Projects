//
//  ProductViewModel.swift
//  MVVM and API CALL
//
//  Created by Rushikesh Dadas on 13/07/24.
//

import Foundation

@Observable
class ProductViewModel{
    
    var products = [Product]()
    
    func fetchProducts() async {
        do {
            products = try await APIManager.shared.getRequest(url: "https://fakestoreapi.com/products")
        } catch {
            print("Error occured while fetching products", error)
        }
    }
}
