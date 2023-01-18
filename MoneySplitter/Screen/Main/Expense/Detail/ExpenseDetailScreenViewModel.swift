//
//  ExpenseDetailScreenViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 17.01.2023.
//

import Foundation
import Combine
//
//let id: UUID
//let category: ExpenseCategory
//let type: ExpenseType
//let frequency: ExpenseFrequency
//let value: Double
//let currency: Currency
//let tags: [Tag]
//let service: Service
//let isFavorite: Bool

class ExpenseDetailScreenViewModel: ObservableObject {
    
//    @Published var id: String
//    @Published var category: ExpenseCategory
//    @Published var type: ExpenseType
    
    @Published var value: Double
    @Published var currency: Currency
    @Published var frequency: ExpenseFrequency
    
    init(value: Double, currency: Currency, frequency: ExpenseFrequency) {
        self.value = value
        self.currency = currency
        self.frequency = frequency
    }
}

class ExpenseDetailUpdateScreenViewModel: ExpenseDetailScreenViewModel {
    
    init(expense: Expense) {
        super.init(value: expense.value,
                   currency: expense.currency,
                   frequency: expense.frequency)
    }
}
