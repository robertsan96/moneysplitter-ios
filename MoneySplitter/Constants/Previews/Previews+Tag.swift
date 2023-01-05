//
//  Previews+Tag.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

extension Constants.Previews {
    
    struct Tags {
        
        static var movies = MoneySplitter.Tag(id: UUID(), name: "movies")
        static var entertainment = MoneySplitter.Tag(id: UUID(), name: "entertainment")
        static var favorites = MoneySplitter.Tag(id: UUID(), name: "favorites")
        static var finance = MoneySplitter.Tag(id: UUID(), name: "finance")
        static var work = MoneySplitter.Tag(id: UUID(), name: "work")
        static var gaming = MoneySplitter.Tag(id: UUID(), name: "gaming")
        static var house = MoneySplitter.Tag(id: UUID(), name: "house")
        static var utilities = MoneySplitter.Tag(id: UUID(), name: "utilities")
    }
}
