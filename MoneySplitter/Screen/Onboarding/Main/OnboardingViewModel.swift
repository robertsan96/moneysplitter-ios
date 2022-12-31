//
//  OnboardingScreenViewModel.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    
    @Published var selectedPage: PageTag = .noPage
    
    init(selectedPage: PageTag = .initialPage) {
        self.selectedPage = selectedPage
        objectWillChange.send()
        objectWillChange.send()
    }
}

enum PageTag: Int {
    case noPage
    
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
