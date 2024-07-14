//
//  ContentView.swift
//  Guess Country
//
//  Created by Rushikesh Dadas on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukrain", "US"].shuffled()
    
    @State private var correctAnwer = Int.random(in: 0...2)
    
    @State private var showingScore = false;
    @State private var showTitle = ""
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: .blue, location : 0.3),
                .init(color: .indigo, location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.title)
                    .foregroundStyle(.white)
                VStack(spacing: 30) {
                    VStack() {
                        Text("Tap the Flag of")
                            .font(.title2)
                        
                        Text(countries[correctAnwer])
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                    
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score : ???")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding()
        }
        .alert(showTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number : Int) {
        if number == correctAnwer {
            showTitle = "Correct"
        }else {
            showTitle = "Incorrect"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnwer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
