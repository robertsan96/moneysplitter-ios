//
//  Constants+Expense.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

extension Constants.Previews {
    
    struct Expense {
        
        static var pack1: [MoneySplitter.Expense] = [
            .init(id: UUID(),
                    category: .init(id: UUID(), name: "Netflix"),
                    type: .want,
                    frequency: .monthly,
                    value: 70,
                    currency: .ron,
                    tags: [
                        .init(id: UUID(), name: "movies"),
                        .init(id: UUID(), name: "chill")
                    ])
        ]
    }
}
