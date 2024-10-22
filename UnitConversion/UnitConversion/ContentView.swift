//
//  ContentView.swift
//  UnitConversion
//
//  Created by Felipe Hoffmann on 2024-10-21.
//

import SwiftUI

struct ContentView: View {
    let temperatures = ["Celsius", "Fahrenheit", "Kelvin"]
    let lengths = ["Meters", "Km", "Feet", "Yards", "Miles"]
    
    @State private var selectedTemperatureFrom = "Celsius"
    @State private var selectedTemperatureTo = "Fahrenheit"
    @State private var valueTemperatureFrom: Double = 23.0
    
    @State private var selectedLengthFrom = "Meters"
    @State private var selectedLengthTo = "Km"
    @State private var valueLengthFrom: Double = 100.0
    
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
    
    var convertedLengh: Double {
        var convertedValue = valueLengthFrom
        
        if selectedLengthFrom == "Meters" {
            if selectedLengthTo == "Km" {
                convertedValue = valueLengthFrom / 1000
            }
            if selectedLengthTo == "Feet" {
                let feetPerMeter = 3.28084
                convertedValue = valueLengthFrom * feetPerMeter
            }
            if selectedLengthTo == "Yards" {
                convertedValue = valueLengthFrom * 1.09361
            }
            if selectedLengthTo == "Miles" {
                let milesPerKm = 0.621371
                convertedValue = valueLengthFrom * milesPerKm
            }
        }
        
        if selectedLengthFrom == "Km" {
            if selectedLengthTo == "Meters" {
                convertedValue = valueLengthFrom * 1000
            }
            if selectedLengthTo == "Feet" {
                let feetPerMeter = 3.28084
                convertedValue = valueLengthFrom * feetPerMeter * 1000
            }
            if selectedLengthTo == "Yards" {
                convertedValue = valueLengthFrom * 1
            }
            if selectedLengthTo == "Miles" {
                let milesPerKm = 0.621371
                convertedValue = valueLengthFrom * milesPerKm
            }
        }
        
        if selectedLengthFrom == "Feet" {
            if selectedLengthTo == "Meters" {
                convertedValue = valueLengthFrom / 3.28084
            }
            if selectedLengthTo == "Km" {
                convertedValue = valueLengthFrom / 3.28084 / 1000
            }
            if selectedLengthTo == "Yards" {
                convertedValue = valueLengthFrom / 3.28084
            }
            if selectedLengthTo == "Miles" {
                let milesPerKm = 0.621371
                let milesPerFoot = 0.000189394
                convertedValue = valueLengthFrom * milesPerFoot
            }
        }
        
        if selectedLengthFrom == "Yards" {
            if selectedLengthTo == "Meters" {
                convertedValue = valueLengthFrom * 0.9144
            }
            if selectedLengthTo == "Km" {
                convertedValue = valueLengthFrom / 0.9144
            }
            if selectedLengthTo == "Feet" {
                convertedValue = valueLengthFrom / 0.9144
            }
            if selectedLengthTo == "Miles" {
                let milesPerKm = 0.621371
                let milesPerYard = 0.000568181
                let milesPerFoot = 0.000189394
                convertedValue = valueLengthFrom * milesPerYard
            }
        }
        
        if selectedLengthFrom == "Miles" {
            if selectedLengthTo == "Meters" {
                convertedValue = valueLengthFrom * 1609.344
            }
            if selectedLengthTo == "Km" {
                convertedValue = valueLengthFrom * 1609.344 / 1000
            }
            if selectedLengthTo == "Feet" {
                convertedValue = valueLengthFrom * 5280.839
            }
            if selectedLengthTo == "Yards" {
                convertedValue = valueLengthFrom * 1760
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
                    }
                }
                
                Section("Lenght") {
                    Picker("From", selection: $selectedLengthFrom) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    HStack {
                        Text(selectedLengthFrom)
                        TextField("100.0", value: $valueLengthFrom, format: .number.precision(.fractionLength(2)))
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.trailing)
                    }
                    
                    Picker("To", selection: $selectedLengthTo) {
                        ForEach(lengths, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                    
                    HStack {
                        Text(selectedLengthTo)
                        Spacer()
                        Text("\(convertedLengh, specifier: "%.2f")")
                    }
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
