//
//  ExpenseListScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import SwiftUI

struct ExpenseListScreenView: View {
    
    @ObservedObject var viewModel: ExpenseListScreenViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.expenses) { expense in
                        NavigationLink {
                            ExpenseDetailScreenView()
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

struct ExpenseListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseListScreenView(viewModel: .mock)
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
