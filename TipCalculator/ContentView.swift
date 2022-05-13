//
//  ContentView.swift
//  TipCalculator
//
//  Created by Marina Shvagir on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercentages = [0, 5, 10, 15, 25]
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let amountPerPerson = ((orderAmount * tipSelection / 100) + orderAmount) / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker(selection: $numberOfPeople, label: Text("Number of people")) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Tips")) {
                    Picker(selection: $tipPercentage, label: Text("Tip percentage")) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .background(Color(#colorLiteral(red: 0.8450558782, green: 0.5136885643, blue: 0.9940444827, alpha: 1)))
                    .cornerRadius(8)
                }
                Section(header: Text("Total per person")) {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationTitle("Tip Calculator")
            .navigationBarTitleDisplayMode(.inline)
            .blueNavigation
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
