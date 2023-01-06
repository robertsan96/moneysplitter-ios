//
//  ExpenseFilterViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 06.01.2023.
//

import Foundation
import Combine

class ExpenseFilterViewModel: ObservableObject {

    @Published var filterFavorite: Bool = false
    
    @Published var filterSelectedFrequencyString = R.string.localizable.all() // for picker
    @Published var filterSelectedExpenseFrequency: ExpenseFrequency? = nil // for outside
    @Published var filterFrequencies = ExpenseFrequency.allCases.map { $0.localizedName }
    
    var filterContext = ExpenseFilterContext()
    
    private var subscriptions: Set<AnyCancellable> = Set()
    
    init() {
        $filterSelectedFrequencyString.sink { [weak self] selectedFrequency in
            let selectedExpenseFrequency = ExpenseFrequency.allCases.first { $0.localizedName == selectedFrequency }
            self?.filterSelectedExpenseFrequency = selectedExpenseFrequency
            self?.filterContext.selectedExpenseFrequency = selectedExpenseFrequency
        }
        .store(in: &subscriptions)
        
        $filterFavorite.sink { [weak self] onlyFavorites in
            self?.filterContext.onlyFavorites = onlyFavorites
        }
        .store(in: &subscriptions)
    }
}

extension ExpenseFilterViewModel {
    
    static var mock = ExpenseFilterViewModel()
}
