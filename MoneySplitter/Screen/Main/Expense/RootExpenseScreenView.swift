//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootExpenseScreenView: View {
    
    @EnvironmentObject var navigationCoordinator: ExpenseNavigationCoordinator
    
    var body: some View {
        switch navigationCoordinator.activeRoute {
        case .list: ExpenseListScreenView(viewModel: .init(expenses: Constants.Previews.Expense.romanianStarterPack))
        case .read: Text("no read support yet")
        case .create: Text("no create support yet")
        }
    }
}

struct RootExpenseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RootExpenseScreenView()
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
