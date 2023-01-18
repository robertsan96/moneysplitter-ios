//
//  Currency.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

enum Currency: Identifiable {
    
    case usd
    case ron
    
    var id: Int { isoCode }
    
    var name: String {
        switch self {
        case .usd: return "USD"
        case .ron: return "RON"
        }
    }
    
    var localizedName: String {
        switch self {
        case .usd: return R.string.localizable.currencyUsdName()
        case .ron: return R.string.localizable.currencyRonName()
        }
    }
    
    var symbol: String {
        switch self {
        case .usd: return "$"
        case .ron: return name
        }
    }
    
    var isoCode: Int {
        switch self {
        case .usd: return 840
        case .ron: return 946
        }
    }
    
    var flag: String {
        switch self {
        case .usd: return "🇺🇸"
        case .ron: return "🇷🇴"
        }
    }
}
