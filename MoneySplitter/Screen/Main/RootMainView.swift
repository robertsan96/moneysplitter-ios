//
//  RootMainView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootMainView: View {
    
    @EnvironmentObject var navigationCoordinator: MainNavigationCoordinator
    
    var body: some View {
        TabView(selection: $navigationCoordinator.activeRoute) {
            ForEach(navigationCoordinator.tabs, id:\.self) { (tab: MainRoute) in
                switch tab {
                case .home:
                    GeneralHomeScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .splitter:
                    GeneralSplitterScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .income:
                    GeneralIncomeScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .expense: RootExpenseScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                        .environmentObject(ExpenseNavigationCoordinator(activeRoute: .list, parent: navigationCoordinator))
                }
            }
        }
    }
    
    private func getSystemImage(for route: MainRoute) -> String {
        switch route {
        case .home: return "house"
        case .splitter: return "move.3d"
        case .income: return "dollarsign.arrow.circlepath"
        case .expense: return "doc.text"
        }
    }
}

struct RootMainView_Previews: PreviewProvider {
    static var previews: some View {
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .home))
    }
}
