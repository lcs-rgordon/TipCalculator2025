//
//  TipCalculationView.swift
//  TipCalculator
//
//  Created by Russell Gordon on 2025-03-18.
//

import SwiftUI

struct TipCalculationView: View {
    
    // MARK: Stored properties
    @State var viewModel = TipCalculationViewModel()
    
    // MARK: Computed properties
    
    // User interface
    var body: some View {
        NavigationStack {

            VStack {

                // Show output based on what input is provided
                
                // If we got valid input, show it!
                if let tipCalculationResult = viewModel.tipCalculationResult {
                    
                    VStack {
                        HStack {
                            Text("Bill amount:")
                                .bold()
                            
                            Text("\(tipCalculationResult.billAmount.formatted(.currency(code: "CAD")))")
                        }
                        HStack {
                            Text("Tip percentage:")
                                .bold()
                            
                            Text("\(tipCalculationResult.tipPercentage.formatted(.percent))")
                        }
                        HStack {
                            Text("Tip dollar amount:")
                                .bold()
                            
                            Text("\(tipCalculationResult.tipAmount.formatted(.currency(code: "CAD")))")
                        }
                        HStack {
                            Text("Total amount of bill:")
                                .bold()
                            
                            Text("\(tipCalculationResult.totalAmount.formatted(.currency(code: "CAD")))")
                        }
                    }
                    .frame(height: 200)
                    
                } else {
                    
                    // If we didn't get valid input, show an error message
                    ContentUnavailableView(
                        "Unable to calculate tip",
                        systemImage: "gear.badge.questionmark",
                        description: Text(viewModel.recoverySuggestion)
                    )
                    .frame(height: 200)
                    
                }
                
                // Collect input
                
                // Bill amount
                TextField("Enter the bill amount, e.g.: 47.45", text: $viewModel.providedBillAmount)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Enter the tip percentage, e.g.: 17.5", text: $viewModel.providedTipPercentage)
                    .textFieldStyle(.roundedBorder)

                // Show a history of prior calculations
                Spacer()
                
            }
            .padding()
            .navigationTitle("Tip Calculator")

        }
    }
}

#Preview {
    TipCalculationView()
}
