//
//  ExpenseNavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

class ExpenseNavigationCoordinator: BaseNavigationCoordinator<ExpenseRoute> {
    
    @Published var isFiltering: Bool = false
    
    override func registerSubscriptions() {
        $activeRoute.sink { route in
            switch route {
            case .list(let isFiltering): self.isFiltering = isFiltering
            default: break
            }
        }
        .store(in: &subscriptions)
    }
    
    func didPressFilter() {
        activeRoute = .list(isFiltering: true)
    }
}

enum ExpenseRoute: Route {

    case list(isFiltering: Bool)
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
