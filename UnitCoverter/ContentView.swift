//
//  ContentView.swift
//  UnitCoverter
//
//  Created by Yury Prokhorov on 02.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var unitInput = "meters"
    @State private var unitOutput = "kilometers"
    @State private var numberInput = 0.0

    var transferUnitAmount: Double {
        var transferUnitAmount = 0.0
        
        switch unitInput {
        
        case "meters":
            transferUnitAmount = numberInput
        case "kilometers":
            transferUnitAmount = numberInput * 1000
        case "feet":
            transferUnitAmount = numberInput * 3280.839895
        case "yards":
            transferUnitAmount = numberInput * 1093.6132983
        case "miles":
            transferUnitAmount = numberInput * 0.6213688756
        default:
            transferUnitAmount = numberInput
        }
        return transferUnitAmount
    }

    var numberOutput: Double {
        var numberOutput = 0.0
        
        switch unitOutput {
        case "meters":
            numberOutput = transferUnitAmount
        case "kilometers":
            numberOutput = transferUnitAmount * 0.001
        case "feet":
            numberOutput = transferUnitAmount * 3.280839895
        case "yards":
            numberOutput = transferUnitAmount * 1.0936132983
        case "miles":
            numberOutput = transferUnitAmount * 0.0006213689
        default:
            numberOutput = transferUnitAmount
        }
        return numberOutput
    }
    
    var units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    
    var body: some View {
        Form {
            
            Section{
                Picker("", selection: $unitInput) {
                    ForEach(units, id:\.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            } header: {
                Text("Choose unit you want to convert")
            }
        
        
        Section{
            Picker("", selection: $unitOutput) {
                ForEach(units, id:\.self) {
                    Text("\($0)")
                }
            }.pickerStyle(.segmented)
        } header: {
            Text("Choose unit to which you want to convert")
        }
    
        Section {
            TextField("Amount", value: $numberInput, format: .number)
                .padding(.all, 10.0)
        } header: {
                Text ("How many \(unitInput) do you have")
        }
            
        Section {
            Text(numberOutput, format: .number)
        } header: {
                Text("\(unitOutput)")
            }
        
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
