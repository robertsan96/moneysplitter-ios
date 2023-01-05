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
                    sectionNeeds
                        .padding(.horizontal)
                    sectionWants
                        .padding(.horizontal)
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
    
    private var sectionNeeds: some View {
        Section {
            ForEach(viewModel.needs) { expense in
                NavigationLink {
                    ExpenseDetailScreenView()
                } label: {
                    ExpenseCardView(colorContext: .secondary,
                                    viewModel: ExpenseCardViewModel(expense: expense))
                    .padding(.vertical, 5)
                }
            }
        } header: {
            sectionHeader(R.string.localizable.expenseTypeNeedNamePlural())
        }
    }
    
    private var sectionWants: some View {
        Section {
            ForEach(viewModel.wants) { expense in
                NavigationLink {
                    ExpenseDetailScreenView()
                } label: {
                    ExpenseCardView(colorContext: .secondary,
                                    viewModel: ExpenseCardViewModel(expense: expense))
                    .padding(.vertical, 5)
                }
            }
        } header: {
            sectionHeader(R.string.localizable.expenseTypeWantNamePlural())
                .padding(.top)
        }
    }
    
    private func sectionHeader(_ title: String) -> some View {
        VStack {
            HStack {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.color(for: .text, in: .primary))
                Spacer()
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
