//
//  MainNavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation

class MainNavigationCoordinator: BaseNavigationCoordinator<MainRoute> {
    
    @Published var selectedTab: MainRoute = .expense
    
    var tabs: [MainRoute] = [
        .home,
        .splitter,
        .income,
        .expense
    ]
}

// MARK: Route configuration
enum MainRoute: Route {
    
    case home
    case splitter
    case income
    case expense
}

extension MainRoute {
    
    var localizedTitle: String {
        switch self {
        case .home: return R.string.localizable.routeMainHomeTitle()
        case .splitter: return R.string.localizable.routeMainSplitterTitle()
        case .income: return R.string.localizable.routeMainIncomeTitle()
        case .expense: return R.string.localizable.routeMainExpenseTitle()
        }
    }
}
