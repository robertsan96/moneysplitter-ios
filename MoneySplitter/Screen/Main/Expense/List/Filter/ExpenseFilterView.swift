//
//  ExpenseFilterView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 06.01.2023.
//

import SwiftUI

struct ExpenseFilterView: View {
    
    @ObservedObject var viewModel: ExpenseFilterViewModel
    var colorContext: ColorContext = .secondary
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.color(for: .background, in: colorContext))
                .cornerRadius(Constants.CornerRadius.box)
                .edgesIgnoringSafeArea(.all)
            VStack {
                // TODO: Implement Filter for Favorites
//                HStack {
//                    text(R.string.localizable.expenseFilterFavorite())
//                    Spacer()
//                    Toggle(isOn: $viewModel.filterFavorite) { }
//                }
                
                HStack {
                    text(R.string.localizable.expenseFilterFrequency())
                    Spacer()
                    Picker(R.string.localizable.expenseFilterFrequency(), selection: $viewModel.filterSelectedFrequencyString) {
                        Text(R.string.localizable.all()).tag(R.string.localizable.all())
                        ForEach(viewModel.filterFrequencies, id:\.self) { freq in
                            Text(freq).id(freq)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func text(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.color(for: .text, in: colorContext))
    }
}

struct ExpenseFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseFilterView(viewModel: .mock)
    }
}
