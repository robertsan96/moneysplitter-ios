//
//  OnboardingScreenViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    @Published var selectedPage: PageTag = .initialPage
    
    init(selectedPage: PageTag = .initialPage) {
        self.selectedPage = selectedPage
    }
}

enum PageTag: Int {
    case initialPage
    case splitterPage
    case expensePage
    case incomePage
    case pipesPage
}

extension OnboardingViewModel {
    static func mock(selectedPage: PageTag) -> OnboardingViewModel {
        .init(selectedPage: selectedPage)
    }
}
