//
//  ExpenseListScreenViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 05.01.2023.
//

import Foundation
import Combine

class ExpenseListScreenViewModel: ObservableObject {
    
    @Published var expenses: [Expense]
    
    init(expenses: [Expense]) {
        self.expenses = expenses
    }
}

extension ExpenseListScreenViewModel {
    
    static var mock: ExpenseListScreenViewModel = .init(expenses: Constants.Previews.Expense.romanianStarterPack)
}
