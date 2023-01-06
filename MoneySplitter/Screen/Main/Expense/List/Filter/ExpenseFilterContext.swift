//
//  ExpenseFilterContext.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 06.01.2023.
//

import Foundation

struct ExpenseFilterContext: Equatable {
    var onlyFavorites: Bool = false
    var selectedExpenseFrequency: ExpenseFrequency?
}
