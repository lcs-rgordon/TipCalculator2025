//
//  TipCalculationViewModel.swift
//  TipCalculator
//
//  Created by Russell Gordon on 2025-03-18.
//

import SwiftUI

// VIEW MODEL
@Observable
class TipCalculationViewModel {
    
    // MARK: Stored properties
    
    // Will be bound to the text fields in the view
    var providedBillAmount: String
    var providedTipPercentage: String
    
    // Show a recovery suggestion for how to fix input, if needed
    var recoverySuggestion: String
    
    // MARK: Computed properties
    var tipCalculationResult: TipCalculation? {
        
        // Check that the bill amount is valid (numeric)
        guard let billAmount = Double(providedBillAmount) else {
            recoverySuggestion = "Please provide numeric input, e.g.: 27.65"
            return nil
        }
        
        // Check that the tip percentage is valid (numeric)
        guard let tipPercentage = Double(providedTipPercentage) else {
            recoverySuggestion = "Please provide a valid percentage, e.g.: 15"
            return nil
        }
        
        // Check that the bill amount is positive!
        guard billAmount > 0 else {
            recoverySuggestion = "Please provide a bill amount greater than zero."
            return nil
        }
        
        // Check that the tip percentage is positive!
        guard tipPercentage > 0 else {
            recoverySuggestion = "Please provide a tip percentage greater than zero."
            return nil
        }
        
        // Use the model to return a tip calculation!
        recoverySuggestion = ""
        return TipCalculation(
            billAmount: billAmount,
            tipPercentage: tipPercentage / 100.0
        )
    }
    
    // MARK: Initializer(s)
    init(
        providedBillAmount: String = "",
        providedTipPercentage: String = "",
        recoverySuggestion: String = ""
    ) {
        self.providedBillAmount = providedBillAmount
        self.providedTipPercentage = providedTipPercentage
        self.recoverySuggestion = recoverySuggestion
    }
    
    // MARK: Function(s)
    
}

