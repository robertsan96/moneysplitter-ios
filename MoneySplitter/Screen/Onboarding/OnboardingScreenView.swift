//
//  OnboardingScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingScreenView: View {
    var body: some View {
        TabView {
            OnboardingPageOne()
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingPageOne: View {
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView()
    }
}
