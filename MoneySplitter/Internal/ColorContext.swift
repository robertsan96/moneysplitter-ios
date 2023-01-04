//
//  ColorContext.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 05.01.2023.
//

import Foundation

/// Passed to children views to make color management
/// easier at a lower level.
///
/// parent: primary
/// children: secondary
/// children's children: ternary
enum ColorContext {
    case primary
    case secondary
    case ternary
    case quaternary
    
    var next: ColorContext {
        switch self {
        case .primary: return .secondary
        case .secondary: return .ternary
        case .ternary: return .quaternary
        case .quaternary: return .quaternary // no optionals :) 
        }
    }
}
