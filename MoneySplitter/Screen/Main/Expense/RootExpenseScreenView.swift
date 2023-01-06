//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootExpenseScreenView: View {
    
    @EnvironmentObject var navigationCoordinator: ExpenseNavigationCoordinator
    
    // This view model should be moved in a wrapper.
    // It is affecting the filters side, as the sheet
    // is dismissing, navigationCoordinator triggers
    // a change and if we would instantiate the vm
    // in the ".list" case, it would rerender everything
    // in that case. ExpenseListScreenView contains
    // a @ObservedObject property of the vm.
    @StateObject var expenseListScreenViewModel = ExpenseListScreenViewModel(expenses: Constants.Previews.Expense.romanianStarterPack)
    
    var body: some View {
        switch navigationCoordinator.activeRoute {
        case .list(_):
            ExpenseListScreenView(viewModel: expenseListScreenViewModel)
        case .read: Text("no read support yet")
        case .create: Text("no create support yet")
        }
    }
}

struct RootExpenseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RootExpenseScreenView()
            .environmentObject(ExpenseNavigationCoordinator(activeRoute: .list(isFiltering: false)))
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
