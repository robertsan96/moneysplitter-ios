//
//  GeneralRootView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct GeneralRootView: View {
    
    @EnvironmentObject var navigationCoordinator: GeneralNavigationCoordinator
    
    var body: some View {
        TabView(selection: $navigationCoordinator.selectedTab) {
            ForEach(navigationCoordinator.tabs, id:\.self) { (tab: Route) in
                switch tab {
                case .generalHome:
                    GeneralHomeScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .generalSplitter:
                    GeneralSplitterScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .generalIncome:
                    GeneralIncomeScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                case .generalExpense: GeneralExpenseScreenView()
                        .tabItem { Label(tab.localizedTitle, systemImage: getSystemImage(for: tab)) }
                default: Text("This is not a valid tab.")
                }
            }
        }
    }
    
    private func getSystemImage(for route: Route) -> String {
        switch route {
        case .generalHome: return "house"
        case .generalSplitter: return "move.3d"
        case .generalIncome: return "dollarsign.arrow.circlepath"
        case .generalExpense: return "doc.text"
        default: return ""
        }
    }
}

struct GeneralRootView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralRootView()
            .environmentObject(GeneralNavigationCoordinator())
    }
}
