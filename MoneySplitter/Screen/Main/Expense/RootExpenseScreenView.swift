//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootExpenseScreenView: View {
    
    var expenses: [Expense] = Constants.Previews.Expense.romanianStarterPack
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(expenses) { expense in
                        NavigationLink {
                            GeometryReader { proxy in
                                VStack {
                                    Text(expense.category.name)
                                    
                                    VStack {
                                        Text("Price:")
                                        HStack {
                                            Text("\(expense.value) \(expense.currency.name) /")
                                            Text(expense.frequency.localizedName)
                                        }
                                    }
                                    
                                    VStack {
                                        Text("Cost per year")
                                        Text("\(expense.value * 12)")
                                    }
                                }
                            }
                                .background(Color.primaryBackgroundColor)
                        } label: {
                            ExpenseCardView(colorContext: .secondary,
                                            viewModel: ExpenseCardViewModel(expense: expense))
                                .padding(.horizontal)
                                .padding(.vertical, 5)
                        }
                    }
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
            .background(Color.primaryBackgroundColor)
            .navigationBarTitleDisplayMode(.inline)
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
        RootExpenseScreenView()
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
