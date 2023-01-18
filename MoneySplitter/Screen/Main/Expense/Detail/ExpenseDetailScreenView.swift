//
//  ExpenseDetailScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 05.01.2023.
//

import SwiftUI

struct ExpenseDetailScreenView: View {
    
    @ObservedObject var viewModel: ExpenseDetailScreenViewModel
    
    var body: some View {
        VStack {
            CurrencyInputView(value: $viewModel.value,
                              selectedCurrency: $viewModel.currency,
                              selectedFrequency: $viewModel.frequency)
            .padding()
            Text(viewModel.frequency.localizedName)
            Spacer()
        }
        .background(Color.color(for: .background, in: .primary))
    }
}

struct ExpenseDetailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseDetailScreenView(viewModel: ExpenseDetailUpdateScreenViewModel(expense: Constants.Previews.Expense.romanianStarterPack.first!))
    }
}
