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
        case .generalHome: return R.string.localizable.routeGeneralHomeTitle()
        case .generalIncome: return R.string.localizable.routeGeneralIncomeTitle()
        case .generalExpense: return R.string.localizable.routeGeneralExpenseTitle()
        case .generalSplitter: return R.string.localizable.routeGeneralSplitterTitle()
            
        default: return ""
        }
    }
}
