//
//  ExpenseCardViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 05.01.2023.
//

import Foundation
import Combine

class ExpenseCardViewModel: ObservableObject {
    
    @Published var expense: Expense
    
    init(expense: Expense) {
        self.expense = expense
    }
}

extension ExpenseCardViewModel {
    static var mock: ExpenseCardViewModel {
        ExpenseCardViewModel(expense: Constants.Previews.Expense.romanianStarterPack.randomElement()!)
    }
}
