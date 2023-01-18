//
//  ExpenseListScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import SwiftUI

struct ExpenseListScreenView: View {
    
    @EnvironmentObject var navigationCoordinator: ExpenseNavigationCoordinator
    @ObservedObject var viewModel: ExpenseListScreenViewModel
    @StateObject var filterViewModel = ExpenseFilterViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.filteredNeeds.isEmpty && viewModel.filteredWants.isEmpty {
                    noExpensesView
                        .padding(.horizontal)
                } else {
                    ScrollView {
                        LazyVStack {
                            sectionNeeds
                                .padding(.horizontal)
                            sectionWants
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color.primaryBackgroundColor)
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $navigationCoordinator.isFiltering, content: {
                ExpenseFilterView(viewModel: filterViewModel)
                    .edgesIgnoringSafeArea(.all)
                    .presentationDetents([.height(150)])
            })
            .toolbar {
                ToolbarItem(placement: .principal) {
                    NavigationLogoView()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    navigationButtons
                }
            }
            .onChange(of: filterViewModel.filterContext, perform: { filterContext in
                withAnimation(.spring()) {
                    viewModel.filterNeeds(filterContext: filterContext)
                    viewModel.sortNeeds()
                    viewModel.filterWants(filterContext: filterContext)
                    viewModel.sortWants()
                }
            })
        }
    }
    
    private var navigationButtons: some View {
        HStack {
            Button {
                navigationCoordinator.didPressFilter()
            } label: {
                Label(R.string.localizable.filter(), systemImage: "line.3.horizontal.decrease.circle")
            }
            Button {
                
            } label: {
                Label(R.string.localizable.add(), systemImage: "plus.circle")
            }

        }
    }
    
    private var noExpensesView: some View {
        VStack {
            Spacer()
            Image(uiImage: R.image.notFound()!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
            Text(R.string.localizable.nothingHere)
                .fontWeight(.bold)
                .padding()
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "plus")
                    Text(R.string.localizable.expenseActionAdd)
                }
            }
            .buttonStyle(PrimaryButton(color: .accentColor))
            .padding()

            Spacer()
        }
    }
    
    private var sectionNeeds: some View {
        Group {
            if viewModel.filteredNeeds.count > 0 {
                Section {
                    ForEach(viewModel.filteredNeeds) { expense in
                        NavigationLink {
                            ExpenseDetailScreenView(viewModel: ExpenseDetailUpdateScreenViewModel(expense: expense))
                        } label: {
                            ExpenseCardView(colorContext: .secondary,
                                            viewModel: ExpenseCardViewModel(expense: expense))
                            .padding(.vertical, 5)
                            .transition(AnyTransition.scale)
                        }
                    }
                } header: {
                    sectionHeader(R.string.localizable.expenseTypeNeedNamePlural())
                }
            }
        }
    }
    
    private var sectionWants: some View {
        Group {
            if viewModel.filteredWants.count > 0 {
                Section {
                    ForEach(viewModel.filteredWants) { expense in
                        NavigationLink {
                            ExpenseDetailScreenView(viewModel: ExpenseDetailUpdateScreenViewModel(expense: expense))
                        } label: {
                            ExpenseCardView(colorContext: .secondary,
                                            viewModel: ExpenseCardViewModel(expense: expense))
                            .padding(.vertical, 5)
                            .transition(AnyTransition.scale)
                        }
                    }
                } header: {
                    sectionHeader(R.string.localizable.expenseTypeWantNamePlural())
                        .padding(.top)
                }
            }
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
            .environmentObject(ExpenseNavigationCoordinator(activeRoute: .list(isFiltering: false)))
        
        RootMainView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
