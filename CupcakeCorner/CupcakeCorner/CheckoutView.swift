//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Rushikesh Dadas on 01/07/24.
//

import SwiftUI

struct CheckoutView: View {
    @Bindable var order = Order()
    @State private var totalCost = 0;
    @State private var ConfirmationMessage = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    AsyncImage(url: URL(string: "https://media.istockphoto.com/id/177047298/photo/vanilla-cupcakes-with-pink-yellow-and-blue-icing-isolated.jpg?s=612x612&w=0&k=20&c=JfKDY3kL7prAt0NJ0efXIV8xn51_lJuIEctxDfdYXqU="), scale: 3) {image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(height: 233)
                    
                    Text("Your total cost is \(order.totalCost, format: .currency(code: "USD"))")
                        .font(.title.bold())
                    
                    Button("Place order"){
                        Task {
                            await placeOrder()
                        }
                    }
                    .padding(.vertical)
                }
            }
            .navigationTitle("Checkout")
            .scrollBounceBehavior(.basedOnSize)
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order Placed", isPresented: $showAlert){
                Button("OK") { }
            } message: {
                Text(ConfirmationMessage)
            }
        }
    }
    
    func placeOrder() async {
        //encode data
        
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode data")
            return
        }
        
        guard let url = URL(string : "https://reqres.in/api/cupcakes") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            print(data)
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                ConfirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type]) cupcakes is on the way"
                showAlert = true
            }
        } catch{
            print("Checkout failed error - \(error.localizedDescription)")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
