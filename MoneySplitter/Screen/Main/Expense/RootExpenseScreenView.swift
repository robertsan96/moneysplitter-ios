//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct ExpenseCard: View {
    
    let expense: Expense
    
    var body: some View {
        VStack {
            HStack {
                logoView
                Text(expense.service.name)
                Spacer()

            }
        }
        .padding()
        .background(.black.opacity(0.03))
        .cornerRadius(15)
    }
    
    private var logoView: some View {
        AsyncImage(url: expense.service.provider.logo) { image in
            logoViewBackground
                .overlay {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
                }
        } placeholder: {
            logoViewBackground
        }
    }
    
    private var logoViewBackground: some View {
        Circle()
            .foregroundColor(Color.black.opacity(0.06))
            .frame(width: 40, height: 40)
    }
}

struct RootExpenseScreenView: View {
    
    var expenses: [Expense] = Constants.Previews.Expense.romanianStarterPack
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(expenses) { expense in
                        ExpenseCard(expense: expense)
                            .padding(.horizontal)
                            .padding(.vertical, 5)
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
