//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation
import Combine

class NavigationCoordinator: ObservableObject {
    
    @Published var activeRoute: Routeable
    
    init() {
        self.activeRoute = OnboardingRoute.initial
    }
    
    init(activeRoute: Routeable) {
        self.activeRoute = activeRoute
    }
}
