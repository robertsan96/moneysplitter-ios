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
}
