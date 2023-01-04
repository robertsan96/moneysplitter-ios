//
//  ExpenseCardView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 05.01.2023.
//

import SwiftUI

struct ExpenseCardView: View {
    
    var colorContext: ColorContext = .primary
    @ObservedObject var viewModel: ExpenseCardViewModel
    
    var body: some View {
        VStack {
            HStack {
                logoView
                Text(viewModel.expense.service.name)
                    .foregroundColor(.primary)
                Spacer()

            }
        }
        .padding()
        .background(Color.color(for: .background, in: colorContext))
        .cornerRadius(15)
    }
    
    private var logoView: some View {
        AsyncImage(url: viewModel.expense.service.provider.logo) { image in
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
            .foregroundColor(.expenseCardLogoViewBackgroundColor)
            .frame(width: 40, height: 40)
    }
}

struct ExpenseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCardView(viewModel: .mock)
    }
}
