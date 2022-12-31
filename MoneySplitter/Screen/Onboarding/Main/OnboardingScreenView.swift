//
//  OnboardingScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @StateObject var onboardingViewModel = OnboardingViewModel()
    
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
        OnboardingScreenView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .initialPage))
    }
}
