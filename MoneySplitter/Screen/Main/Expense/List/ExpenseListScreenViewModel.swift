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
    
    var wants: [Expense] {
        expenses
            .filter { $0.type == .want }
            .sorted { $0.value > $1.value }
    }
    var needs: [Expense] {
        expenses
            .filter { $0.type == .need }
            .sorted { $0.value > $1.value }
    }
    
    init(expenses: [Expense]) {
        self.expenses = expenses
    }
}

extension ExpenseListScreenViewModel {
    
    static var mock: ExpenseListScreenViewModel = .init(expenses: Constants.Previews.Expense.romanianStarterPack)
}
