//
//  CurrencyInputView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 18.01.2023.
//

import SwiftUI

struct CurrencyInputView: View {
    
    @Binding var value: Double
    @Binding var selectedCurrency: Currency
    @Binding var selectedFrequency: ExpenseFrequency
    
    var currencies: [Currency] = [.usd, .ron]
    var colorContext: ColorContext = .primary
    
    var valueFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.currencyCode = "\(selectedCurrency.isoCode)"
        numberFormatter.currencySymbol = selectedCurrency.symbol
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        return numberFormatter
    }
    
    @State private var pickerSelectedCurrency: Currency = .usd
    @State private var pickerSelectedFrequency: ExpenseFrequency = .monthly
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                TextField("Amount", value: $value, formatter: valueFormatter)
                    .foregroundColor(.accentColor)
                    .fontWeight(.medium)
                Picker("Currency", selection: $pickerSelectedCurrency) {
                    ForEach(currencies) { currency in
                        Text(currency.name).tag(currency)
                    }
                }
            }
            .padding()
            Picker("Frequency", selection: $pickerSelectedFrequency) {
                ForEach(ExpenseFrequency.allCases) { frequency in
                    Text(frequency.localizedName).tag(frequency)
                }
            }
            .pickerStyle(.inline)
            .background(Color.color(for: .background, in: colorContext.next.next))
        }
        .onChange(of: pickerSelectedCurrency, perform: { pickerSelectedCurrency in
            selectedCurrency = pickerSelectedCurrency
        })
        .onChange(of: pickerSelectedFrequency, perform: { pickerSelectedFrequency in
            selectedFrequency = pickerSelectedFrequency
        })
//        .padding(.horizontal)
        .foregroundColor(.primary)
        .background(Color.color(for: .background, in: colorContext.next))
        .background(Color.red)
        .cornerRadius(Constants.CornerRadius.box)
    }
}

struct CurrencyInputView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyInputView(value: .constant(100),
                          selectedCurrency: .constant(.usd),
                          selectedFrequency: .constant(.monthly))
    }
}
