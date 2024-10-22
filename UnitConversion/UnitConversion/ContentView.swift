//
//  ContentView.swift
//  UnitConversion
//
//  Created by Felipe Hoffmann on 2024-10-21.
//

import SwiftUI

struct ContentView: View {
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    
    @State private var selectedTemperatureFrom = "Celsius"
    @State private var selectedTemperatureTo = "Fahrenheit"
    @State private var valueTemperatureFrom: Double = 23.0
    
    var convertedTemperature: Double {
        var convertedValue = valueTemperatureFrom
        
        if selectedTemperatureFrom == "Celsius" {
            if selectedTemperatureTo == "Fahrenheit" {
                convertedValue = valueTemperatureFrom * 1.8 + 32
            }
            if selectedTemperatureTo == "Kelvin" {
                convertedValue = valueTemperatureFrom + 273
            }
        }
        
        if selectedTemperatureFrom == "Fahrenheit" {
            if selectedTemperatureTo == "Celsius" {
                convertedValue = 5 * (valueTemperatureFrom - 32) / 9
            }
            if selectedTemperatureTo == "Kelvin" {
                convertedValue = (valueTemperatureFrom - 32) * 5 / 9 + 273
            }
        }
        
        if selectedTemperatureFrom == "Kelvin" {
            if selectedTemperatureTo == "Celsius" {
                convertedValue = valueTemperatureFrom - 273
            }
            if selectedTemperatureTo == "Fahrenheit" {
                convertedValue = (valueTemperatureFrom - 273) * 9 / 5 + 32
            }
        }
        
        return convertedValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section("Temperature") {
                    Picker("From", selection: $selectedTemperatureFrom) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    HStack {
                        Text(selectedTemperatureFrom)
                        TextField("23.0", value: $valueTemperatureFrom, format: .number.precision(.fractionLength(1)))
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Picker("To", selection: $selectedTemperatureTo) {
                        ForEach(temperatures, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    HStack {
                        Text(selectedTemperatureTo)
                        Spacer()
                        Text("\(convertedTemperature, specifier: "%.1f")")
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section("Lenght") {
                    
                }
                
                Section("Time") {
                    
                }
                
                Section("Volume") {
                    
                }
            }
            .navigationTitle("Unit converstion")
        }
    }
}

#Preview {
    ContentView()
}
