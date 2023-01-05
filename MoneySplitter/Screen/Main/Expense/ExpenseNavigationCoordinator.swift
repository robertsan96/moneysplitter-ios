//
//  ExpenseNavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

class ExpenseNavigationCoordinator: BaseNavigationCoordinator<ExpenseRoute> {
    
}

enum ExpenseRoute: Route {

    case list
    case create
    case read
}

extension ExpenseRoute {
    
    var localizedTitle: String {
        switch self {
        case .list: return R.string.localizable.routeExpenseListTitle()
        case .create: return R.string.localizable.routeExpenseCreateTitle()
        case .read: return R.string.localizable.routeExpenseReadTitle()
        }
    }
}
