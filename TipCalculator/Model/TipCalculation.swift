//
//  TipCalculation.swift
//  TipCalculator
//
//  Created by Russell Gordon on 2025-03-18.
//

import Foundation

// MODEL
struct TipCalculation {
    
    // MARK: Stored properties (input)
    let billAmount: Double
    let tipPercentage: Double
    
    // MARK: Computed properties (output)
    var tipAmount: Double {
        return billAmount * tipPercentage
    }
    
    var totalAmount: Double {
        return billAmount + tipAmount
    }
}
