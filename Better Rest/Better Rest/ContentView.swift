//
//  ContentView.swift
//  Better Rest
//
//  Created by Rushikesh Dadas on 29/06/24.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeup = defaultWakeUpTime
    @State private var coffeeCups = 1;
    @State private var sleepHours = 8.0;
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    static var defaultWakeUpTime : Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading, spacing: 10) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    
                    DatePicker("Please enter a date", selection: $wakeup, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Desiered amount of sleep?")
                        .font(.headline)
                    
                    Stepper("\(sleepHours.formatted()) hours", value: $sleepHours, in : 4...12, step: 0.25)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Daily coffee intake?")
                        .font(.headline)
                    
                    Stepper("\(coffeeCups == 1 ? "1 cup" : "\(coffeeCups) cups")", value: $coffeeCups, in: 1...20)
                }
            }
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Calculate", action: calculateSleep)
            }
            .alert(alertTitle, isPresented: $showAlert){
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func calculateSleep() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeup)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepHours, coffee: Double(coffeeCups))
            
            let sleepTime = wakeup - prediction.actualSleep
            
            alertTitle = "Your bedtime is..."
            alertMessage = "\(sleepTime.formatted(date: .omitted, time: .shortened))"
        }catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was some problem calculating your bedtime"
        }
        
        showAlert = true
    }
}

#Preview {
    ContentView()
}
