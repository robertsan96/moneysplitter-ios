//
//  Currency.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

enum Currency {
    
    case usd
    case ron
    
    var localizedName: String {
        switch self {
        case .usd: return R.string.localizable.currencyUsdName()
        case .ron: return R.string.localizable.currencyRonName()
        }
    }
    
    var isoCode: Int {
        switch self {
        case .usd: return 840
        case .ron: return 946
        }
    }
}
