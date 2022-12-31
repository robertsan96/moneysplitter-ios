//
//  OnboardingScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingScreenView: View {
    
    @State private var selectedPage: PageTag = .initialPage
    
    var body: some View {
        TabView(selection: $selectedPage) {
            OnboardingInitialPageView(selectedPage: $selectedPage)
                .tag(PageTag.initialPage)
            OnboardingSplitterPageView(selectedPage: $selectedPage)
                .tag(PageTag.splitterPage)
            OnboardingPipesPageView(selectedPage: $selectedPage)
                .tag(PageTag.pipesPage)
            OnboardingExpensePageView(selectedPage: $selectedPage)
                .tag(PageTag.expensePage)
            OnboardingIncomePageView(selectedPage: $selectedPage)
                .tag(PageTag.incomePage)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
}

enum PageTag: Int {
    case initialPage
    case splitterPage
    case expensePage
    case incomePage
    case pipesPage
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
