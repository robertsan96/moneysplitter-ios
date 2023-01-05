//
//  Color.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

extension Color {
    
    static var primaryBackgroundColor = Color(uiColor: R.color.primaryBackgroundColor()!)
    static var secondaryBackgroundColor = Color(uiColor: R.color.secondaryBackgroundColor()!)
    static var ternaryBackgroundColor = Color(uiColor: R.color.ternaryBackgroundColor()!)
    static var quaternaryBackgroundColor = Color(uiColor: R.color.quaternaryBackgroundColor()!)
    
    static var primaryTextColor = Color(uiColor: R.color.primaryTextColor()!)
    static var secondaryTextColor = Color(uiColor: R.color.secondaryTextColor()!)
    static var ternaryTextColor = Color(uiColor: R.color.ternaryTextColor()!)
    static var quaternaryTextColor = Color(uiColor: R.color.quaternaryTextColor()!)
    
    static var lightGreenishBlue = Color(uiColor: R.color.lightGreenishBlue()!)
    static var mintLeaf = Color(uiColor: R.color.mintLeaf()!)
    
    static var expenseCardLogoViewBackgroundColor = Color(uiColor: R.color.expenseCardLogoViewBackground()!)
}

extension Color {
    
    enum ColorLocationContext {
        case background
        case text
    }
    
    static func color(for locationContext: ColorLocationContext, in colorContext: ColorContext) -> Color {
        switch locationContext {
        case .background: return backgroundColor(for: colorContext)
        case .text: return textColor(for: colorContext)
        }
    }
    
    private static func backgroundColor(for colorContext: ColorContext) -> Color {
        switch colorContext {
        case .primary: return .primaryBackgroundColor
        case .secondary: return .secondaryBackgroundColor
        case .ternary: return .ternaryBackgroundColor
        case .quaternary: return .quaternaryBackgroundColor
        }
    }
    
    private static func textColor(for colorContext: ColorContext) -> Color {
        switch colorContext {
        case .primary: return .primaryTextColor
        case .secondary: return .secondaryTextColor
        case .ternary: return .ternaryTextColor
        case .quaternary: return .quaternaryTextColor
        }
    }
}
