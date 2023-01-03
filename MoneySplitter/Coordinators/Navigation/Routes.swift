//
//  Routeable.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation

enum Route {
    
    case onboardingInitial
    case onboardingSplitter
    case onboardingPipe
    case onboardingExpense
    case onboardingIncome
    
    case generalHome
    case generalExpense
    case generalIncome
    case generalSplitter
}

extension Route {
    
    var localizedTitle: String {
        switch self {
        case .generalHome: return "Home"
        case .generalIncome: return "Income"
        case .generalExpense: return "Expense"
        case .generalSplitter: return "Splitter"
            
        default: return ""
        }
    }
}
