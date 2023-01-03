//
//  OnboardingScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingRootView: View {
    
    @StateObject var onboardingViewModel = OnboardingRootViewModel()
    
    var body: some View {
        TabView(selection: $onboardingViewModel.selectedPage) {
            OnboardingInitialPageView()
                .tag(PageTag.initialPage)
            OnboardingSplitterPageView()
                .tag(PageTag.splitterPage)
            OnboardingPipesPageView()
                .tag(PageTag.pipesPage)
            OnboardingExpensePageView()
                .tag(PageTag.expensePage)
            OnboardingIncomePageView()
                .tag(PageTag.incomePage)
        }
        .environmentObject(onboardingViewModel)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

protocol PageView: View {
    var pageTag: PageTag { get }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingRootView()
            .environmentObject(OnboardingRootViewModel.mock(selectedPage: .initialPage))
    }
}
