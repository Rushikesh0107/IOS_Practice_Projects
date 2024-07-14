//
//  ContentView.swift
//  WeSplit
//
//  Created by Rushikesh Dadas on 09/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercent = 20
    @FocusState private var amountIsFocused : Bool
    
    var totalPerPerson : Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercent)
        
        let tipAmount = checkAmount / 100  * tipSelection
        let grandTotal = checkAmount + tipAmount
        let amountPerPerson = grandTotal / peopleCount
        print(amountPerPerson)
        return amountPerPerson
    }
    
    let tipPercents = [10, 15, 20, 25,0]
    
    var body: some View {
        NavigationStack{
            Form {
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code:Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<11) {
                            Text("\($0) peoples")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercent){
                        ForEach(tipPercents, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section{
                    Text(totalPerPerson, format: .currency(code:Locale.current.currency?.identifier ?? "INR"))
                        .keyboardType(.decimalPad)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
