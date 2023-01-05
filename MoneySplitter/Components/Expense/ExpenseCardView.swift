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
                    .foregroundColor(.color(for: .text, in: colorContext))
                Spacer()
                Image(systemName: viewModel.expense.isFavorite ? "star.fill" : "star")
                    .foregroundColor(viewModel.expense.isFavorite ? .yellow : .color(for: .text, in: colorContext).opacity(0.4))
                Image(systemName: "chevron.right")
                    .foregroundColor(.color(for: .text, in: colorContext))
                    .opacity(0.4)
            }
            Divider()
            HStack {
                tagView
                Spacer()
                costView
            }
        }
        .padding()
        .foregroundColor(.primary)
        .background(Color.color(for: .background, in: colorContext))
        .cornerRadius(Constants.CornerRadius.box)
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
    
    private var tagView: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.expense.tags) { tag in
                    Text(tag.name)
                        .font(.system(size: 10))
                        .foregroundColor(.color(for: .text, in: colorContext.next))
                        .padding(5)
                        .background(
                            Capsule().foregroundColor(.color(for: .background, in: colorContext.next))
                        )
                }
            }
        }
    }
    
    private var costView: some View {
        HStack(spacing: 0) {
            Text(viewModel.expense.valueFormatted)
                .fontWeight(.medium)
                .foregroundColor(.accentColor)
            HStack(spacing: 2) {
                Text("/")
                Text(viewModel.expense.frequency.localizedShortName)
            }
            .frame(width: 35)
            .font(.footnote)
            .foregroundColor(.color(for: .text, in: colorContext))
            .opacity(0.4)
        }
    }
}

struct ExpenseCardView_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseCardView(viewModel: .mock)
    }
}
