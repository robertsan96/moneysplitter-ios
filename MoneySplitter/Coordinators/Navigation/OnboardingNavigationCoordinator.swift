//
//  OnboardingNavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation

class OnboardingNavigationCoordinator: NavigationCoordinator<OnboardingRoute> {
    
    func didFinishOnboarding() {
//        activeRoute = .main
    }
}

enum OnboardingRoute: Route {
    
    case initial
    case splitter
    case pipe
    case expense
    case income
}

extension OnboardingRoute {
    
    var localizedTitle: String {
        switch self {
        case .initial: return R.string.localizable.routeOnboardingInitialTitle()
        case .splitter: return R.string.localizable.routeOnboardingInitialTitle()
        case .pipe: return R.string.localizable.routeOnboardingPipeTitle()
        case .expense: return R.string.localizable.routeOnboardingExpenseTitle()
        case .income: return R.string.localizable.routeOnboardingIncomeTitle()
        }
    }
}
