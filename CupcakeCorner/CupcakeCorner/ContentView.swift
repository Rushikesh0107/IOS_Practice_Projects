//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Rushikesh Dadas on 01/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var order = Order()
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper("Number of cakes \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle(isOn: $order.specialRequestEnabled, label: {
                        Text("Any special request")
                    })
                    
                    if(order.specialRequestEnabled){
                        Toggle(isOn: $order.extraFrosting, label: {
                            Text("Extra Frosting")
                        })
                        
                        Toggle(isOn: $order.sprinklers, label: {
                            Text("Extra Sprinklers")
                        })
                    }
                }
                
                Section{
                    NavigationLink("Add address"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
