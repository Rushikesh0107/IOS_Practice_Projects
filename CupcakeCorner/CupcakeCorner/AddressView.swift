//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Rushikesh Dadas on 01/07/24.
//

import SwiftUI

struct AddressView: View {
    
    @Bindable var order : Order
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name", text: $order.name)
                    TextField("City", text: $order.city)
                    TextField("Street Address", text: $order.streetAddress)
                    TextField("zip", text: $order.zip)
                }
                
                Section{
                    NavigationLink("Check out"){
                        CheckoutView(order: order)
                    }
                    .disabled(order.ischeckOutButtonEnabled)
                }
            }
            .navigationTitle("Delivery Address")
        }
    }
}

#Preview {
    AddressView(order: Order())
}
