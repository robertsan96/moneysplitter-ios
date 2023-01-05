//
//  Expense.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

struct Expense: Identifiable {
    let id: UUID
    let category: ExpenseCategory
    let type: ExpenseType
    let frequency: ExpenseFrequency
    let value: Double
    let currency: Currency
    let tags: [Tag]
    let service: Service
    let isFavorite: Bool
    
    var valueFormatted: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = currency.symbol
        
        return numberFormatter.string(from: value as NSNumber) ?? ""
    }
}
