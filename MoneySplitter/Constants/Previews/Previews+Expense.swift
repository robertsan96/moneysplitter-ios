//
//  Constants+Expense.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

extension Constants.Previews {
    
    struct Expense {
        
        /// Romanian Starter Pack
        static let romanianStarterPack: [MoneySplitter.Expense] = [
            // Enel
            .init(id: UUID(),
                  category: ExpenseCategory.entertainment,
                  type: .want,
                  frequency: .monthly,
                  value: 12,
                  currency: .usd,
                  tags: [
                    Tags.entertainment,
                    Tags.movies
                  ],
                  service: Service.netflixSubscription,
                  isFavorite: true),
            .init(id: UUID(),
                  category: ExpenseCategory.finance,
                  type: .want,
                  frequency: .monthly,
                  value: 10,
                  currency: .usd,
                  tags: [
                    Tags.favorites,
                    Tags.finance
                  ],
                  service: Service.revolutMetal,
                  isFavorite: false),
            .init(id: UUID(),
                  category: ExpenseCategory.telecommunication,
                  type: .need,
                  frequency: .weekly,
                  value: 4,
                  currency: .usd,
                  tags: [
                    Tags.work,
                    Tags.favorites
                  ],
                  service: Service.digiTelecommunications,
                  isFavorite: true),
            .init(id: UUID(),
                  category: ExpenseCategory.cloud,
                  type: .need,
                  frequency: .monthly,
                  value: 10,
                  currency: .usd,
                  tags: [
                    Tags.favorites
                  ],
                  service: Service.appleICloudSubscription,
                  isFavorite: false),
            .init(id: UUID(),
                  category: ExpenseCategory.entertainment,
                  type: .want,
                  frequency: .monthly,
                  value: 14,
                  currency: .usd,
                  tags: [
                    Tags.favorites,
                    Tags.entertainment,
                    Tags.gaming
                  ],
                  service: Service.playStationExtraSubscription,
                  isFavorite: false),
            .init(id: UUID(),
                  category: ExpenseCategory.house,
                  type: .need,
                  frequency: .monthly,
                  value: 200,
                  currency: .usd,
                  tags: [
                    Tags.house,
                    Tags.utilities
                  ],
                  service: Service.enelSubscription,
                  isFavorite: false)
        ]
    }
    
    struct ExpenseCategory {
        
        static var entertainment = MoneySplitter.ExpenseCategory(id: UUID(), name: "Entertainment")
        static var finance = MoneySplitter.ExpenseCategory(id: UUID(), name: "Finance")
        static var telecommunication = MoneySplitter.ExpenseCategory(id: UUID(), name: "Telecommunication")
        static var cloud = MoneySplitter.ExpenseCategory(id: UUID(), name: "Cloud")
        static var house = MoneySplitter.ExpenseCategory(id: UUID(), name: "House")
    }
}
