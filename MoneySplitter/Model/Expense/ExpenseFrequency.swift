//
//  ExpenseFrequency.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

enum ExpenseFrequency {
    case daily
    case weekly
    case halfMonthly
    case monthly
    case halfYearly
    case yearly
    case custom
    
    var localizedName: String {
        switch self {
        case .daily: return R.string.localizable.frequencyDailyName()
        case .weekly: return R.string.localizable.frequencyWeeklyName()
        case .halfMonthly: return R.string.localizable.frequencyHalfMonthlyName()
        case .monthly: return R.string.localizable.frequencyMonthlyName()
        case .halfYearly: return R.string.localizable.frequencyHalfYearlyName()
        case .yearly: return R.string.localizable.frequencyYearlyName()
        case .custom: return R.string.localizable.frequencyCustomName()
        }
    }
    
    var localizedShortName: String {
        switch self {
        case .daily: return R.string.localizable.frequencyDailyNameShort()
        case .weekly: return R.string.localizable.frequencyWeeklyNameShort()
        case .halfMonthly: return R.string.localizable.frequencyHalfMonthlyNameShort()
        case .monthly: return R.string.localizable.frequencyMonthlyNameShort()
        case .halfYearly: return R.string.localizable.frequencyHalfYearlyNameShort()
        case .yearly: return R.string.localizable.frequencyYearlyNameShort()
        case .custom: return R.string.localizable.frequencyCustomNameShort()
        }
    }
}
