//
//  ContentView.swift
//  CurrencyConvertor
//
//  Created by Liping Mechling on 21/12/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currencyToConvert = ""
    @State private var convertTo = ""
    @State private var totalAmount = ""
    let rates = ["USD": 1.00, "EUR": 0.81, "CNY": 6.55, "JPY": 103.34, "GBP": 0.74]
    //computed property:
    var convertResult: Double {
        let result = Double(totalAmount) ?? 0
        let target = rates[convertTo] ?? 0
        let convertResult = result * target
        
        return convertResult
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How much USD to convert:")) {
                    TextField("Enter the amount", text: $totalAmount)
                        .keyboardType(.decimalPad)
                }.textCase(nil)
                
                Section {
                    Picker("Choose a currency to convert:", selection: $convertTo) {
                        ForEach(rates.sorted(by: >), id: \.key) { key, value in
                            Text(key + " \(value)")
                        }
                    }
                }
                
                Section(header: Text("Result")) {
                    Text("\(convertResult, specifier: "%.2f")")
                }.textCase(nil)
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
