//
//  ExpenseType.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

enum ExpenseType {
    case need
    case want
    
    var localizedString: String {
        switch self {
        case .need: return R.string.localizable.expenseTypeNeedName()
        case .want: return R.string.localizable.expenseTypeWantName()
        }
    }
}
