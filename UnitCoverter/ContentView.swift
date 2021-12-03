//
//  ContentView.swift
//  UnitCoverter
//
//  Created by Yury Prokhorov on 02.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var firstUnit = "meters"
    @State private var secondUnit = "kilometers"
    @State private var firstUnitAmount = 0.0
    
    
    var secondUnitAmount: Double {
        var secondUnitAmount = 0.0
        
        switch firstUnit {
        
        case "meters":
            switch secondUnit{
            case "meters":
                secondUnitAmount = firstUnitAmount
            case "kilometers":
                secondUnitAmount = firstUnitAmount * 0.001
            case "feet":
                secondUnitAmount = firstUnitAmount * 3.28084
            case "yards":
                secondUnitAmount = firstUnitAmount * 1.0936132983
            case "miles":
                secondUnitAmount = firstUnitAmount * 0.00062137121212121
            default:
                secondUnitAmount = 0.0
            }
            
        case "kilometers":
            switch secondUnit{
            case "meters":
                secondUnitAmount = firstUnitAmount * 1000
            case "kilometers":
                secondUnitAmount = firstUnitAmount
            case "feet":
                secondUnitAmount = firstUnitAmount * 3280.839895
            case "yards":
                secondUnitAmount = firstUnitAmount * 1093.6132983
            case "miles":
                secondUnitAmount = firstUnitAmount * 0.621371
            default:
                secondUnitAmount = 0.0
            }
            
        case "feet":
            switch secondUnit{
            case "meters":
                secondUnitAmount = firstUnitAmount * 0.3048
            case "kilometers":
                secondUnitAmount = firstUnitAmount * 0.0003048
            case "feet":
                secondUnitAmount = firstUnitAmount
            case "yards":
                secondUnitAmount = firstUnitAmount * 0.3333333333
            case "miles":
                secondUnitAmount = firstUnitAmount * 0.0001893932
            default:
                secondUnitAmount = 0.0
            }
            
        case "yards":
            switch secondUnit{
            case "meters":
                secondUnitAmount = firstUnitAmount * 0.9144
            case "kilometers":
                secondUnitAmount = firstUnitAmount * 0.0009144
            case "feet":
                secondUnitAmount = firstUnitAmount * 3
            case "yards":
                secondUnitAmount = firstUnitAmount * 1
            case "miles":
                secondUnitAmount = firstUnitAmount * 0.0005681797
            default:
                secondUnitAmount = 0.0
            }
            
        case "miles":
            switch secondUnit{
            case "meters":
                secondUnitAmount = firstUnitAmount * 1609.35
            case "kilometers":
                secondUnitAmount = firstUnitAmount * 1.60935
            case "feet":
                secondUnitAmount = firstUnitAmount * 5280.019685
            case "yards":
                secondUnitAmount = firstUnitAmount * 1760.0065617
            case "miles":
                secondUnitAmount = firstUnitAmount
            default:
                secondUnitAmount = 0.0
            }
            
        default:
            secondUnitAmount = 0.0
        }
        return secondUnitAmount
    }
    
    
    var units = ["meters", "kilometers", "feet", "yards", "miles"]
    
    
    var body: some View {
        Form {
            
            Section{
                Picker("", selection: $firstUnit) {
                    ForEach(units, id:\.self) {
                        Text("\($0)")
                    }
                }.pickerStyle(.segmented)
            } header: {
                Text("Choose unit you want to convert")
            }
        
        
        Section{
            Picker("", selection: $secondUnit) {
                ForEach(units, id:\.self) {
                    Text("\($0)")
                }
            }.pickerStyle(.segmented)
        } header: {
            Text("Choose unit to which you want to convert")
        }
    
        Section {
            TextField("Amount", value: $firstUnitAmount, format: .number)
                    .padding(.all, 10.0)
        } header: {
                Text ("How many \(firstUnit) do you have")
        }
            
        Section {
            Text(secondUnitAmount, format: .number)
        } header: {
                Text("\(secondUnit)")
            }
        
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
