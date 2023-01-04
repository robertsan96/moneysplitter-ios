//
//  Previews+Service.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

extension Constants.Previews {
    
    struct Service {
        
        static let netflixSubscription = MoneySplitter.Service(id: UUID(), name: "Netflix Family Subscription", provider: Provider.netflix)
        static let appleICloudSubscription = MoneySplitter.Service(id: UUID(), name: "Apple iCloud+", provider: Provider.apple)
        static let revolutMetal = MoneySplitter.Service(id: UUID(), name: "Revolut Metal", provider: Provider.revolut)
        static let digiTelecommunications = MoneySplitter.Service(id: UUID(), name: "Digi ISP", provider: Provider.digi)
        static let playStationExtraSubscription = MoneySplitter.Service(id: UUID(), name: "PlayStation Extra", provider: Provider.sonyPlaystation)
        static let enelSubscription = MoneySplitter.Service(id: UUID(), name: "Enel", provider: Provider.enel)
    }
}
