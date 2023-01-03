//
//  Routeable.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation

protocol Routeable { }

enum OnboardingRoute: Routeable {
    
    case initial
    case splitter
    case pipe
    case expense
    case income
}

enum GeneralRoute: Routeable {
    
    case home
    case expense
    case income
}
