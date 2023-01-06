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
    
    @Published var filteredNeeds: [Expense] = []
    @Published var filteredWants: [Expense] = []
    
    private var cancellables: Set<AnyCancellable> = Set()
    
    init(expenses: [Expense]) {
        self.expenses = expenses
        
        $expenses.sink { [weak self] expenses in
            self?.filterNeeds()
            self?.filterWants()
        }
        .store(in: &cancellables)
    }
    
    func filterNeeds(filterContext: ExpenseFilterContext = ExpenseFilterContext()) {
        // 1. Build matching expenses based on criteria
        let matchingCriteria = expenses
            .filter { $0.type == .need }
            .filter { filterContext.onlyFavorites == true ? $0.isFavorite : true }
            .filter {
                filterContext.selectedExpenseFrequency != nil ? $0.frequency == filterContext.selectedExpenseFrequency : true
            }
        
        // 2. Remove anything not matching criteria
        filteredNeeds.removeAll { expense in
            !matchingCriteria.contains(expense)
        }
        
        // 3. Add anything that does not exist
        matchingCriteria.forEach { expense in
            guard !filteredNeeds.contains(expense) else { return }
            filteredNeeds.append(expense)
        }
    }
    
    func sortNeeds() {
        filteredNeeds.sort { $0.value < $1.value }
    }
    
    func filterWants(filterContext: ExpenseFilterContext = ExpenseFilterContext()) {
        // 1. Build matching expenses based on criteria
        let matchingCriteria = expenses
            .filter { $0.type == .want }
            .filter {
                filterContext.onlyFavorites == true ? $0.isFavorite : true
                // more filters
            }
        
        // 2. Remove anything not matching criteria
        filteredWants.removeAll { expense in
            !matchingCriteria.contains(expense)
        }
        
        // 3. Add anything that does not exist
        matchingCriteria.forEach { expense in
            guard !filteredWants.contains(expense) else { return }
            filteredWants.append(expense)
        }
    }
    
    func sortWants() {
        filteredNeeds.sort { $0.value < $1.value }
    }
}

extension ExpenseListScreenViewModel {
    
    static var mock: ExpenseListScreenViewModel = .init(expenses: Constants.Previews.Expense.romanianStarterPack)
}
