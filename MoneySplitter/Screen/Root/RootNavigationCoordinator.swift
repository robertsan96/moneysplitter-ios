//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import Foundation
import Combine

class RootNavigationCoordinator: BaseNavigationCoordinator<RootRoute> {
    
    init() {
        super.init(activeRoute: .main)
    }
    
    override init(activeRoute: RootRoute) {
        super.init(activeRoute: activeRoute)
    }
}

// MARK: Route Configuration
enum RootRoute: Route {
    
    case onboarding
    case main
}

extension RootRoute {
    
    var localizedTitle: String {
        switch self {
        case .onboarding: return R.string.localizable.routeRootOnboardingTitle()
        case .main: return R.string.localizable.routeRootMainTitle()
        }
    }
}
