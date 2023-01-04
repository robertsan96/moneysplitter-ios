//
//  OnboardingScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingRootView: View {
    
    @EnvironmentObject var navigationCoordinator: OnboardingNavigationCoordinator
    
    var body: some View {
        TabView(selection: $navigationCoordinator.activeRoute) {
            OnboardingInitialPageView()
                .tag(OnboardingRoute.initial)
            OnboardingSplitterPageView()
                .tag(OnboardingRoute.splitter)
            OnboardingPipesPageView()
                .tag(OnboardingRoute.pipe)
            OnboardingExpensePageView()
                .tag(OnboardingRoute.expense)
            OnboardingIncomePageView()
                .tag(OnboardingRoute.income)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRootView()
            .environmentObject(OnboardingNavigationCoordinator(activeRoute: .initial))
    }
}
