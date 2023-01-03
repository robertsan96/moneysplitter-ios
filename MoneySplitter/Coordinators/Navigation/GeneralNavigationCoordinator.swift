//
//  GeneralNavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation

class GeneralNavigationCoordinator: RootNavigationCoordinator {
    
    @Published var selectedTab: Route = .generalHome
    
    @Published var tabs: [Route] = [
        .generalHome,
        .generalSplitter,
        .generalIncome,
        .generalExpense
    ]
}
