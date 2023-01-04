//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootExpenseScreenView: View {
    
    var expenses: [Expense] = Constants.Previews.Expense.pack1
    
    var body: some View {
        NavigationView {
            LazyVStack {
                ForEach(expenses) { e in
                    VStack {
                        Text(e.type.localizedString)
                    }
                    .frame(width: 300, height: 100)
                    .background(Color.black.opacity(0.04))
                    .cornerRadius(15)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationLogoView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationButtons
                }
            }
        }
    }
    
    private var navigationButtons: some View {
        HStack {
            Button {
                
            } label: {
                Label("Filter", systemImage: "line.3.horizontal.decrease.circle")
            }
            Button {
                
            } label: {
                Label("Add", systemImage: "plus.circle")
            }

        }
    }
}

struct RootExpenseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RootExpenseScreenView(expenses: Constants.Previews.Expense.pack1)
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
