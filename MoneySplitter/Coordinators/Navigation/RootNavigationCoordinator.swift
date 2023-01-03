//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation
import Combine

class RootNavigationCoordinator: ObservableObject {
    
    @Published var activeRoute: Route
    
    init() {
        self.activeRoute = .onboardingInitial
    }
    
    init(activeRoute: Route) {
        self.activeRoute = activeRoute
    }
}

// MARK: Onboarding
extension RootNavigationCoordinator {
    
    func didFinishOnboarding() {
        activeRoute = .generalHome
    }
}
