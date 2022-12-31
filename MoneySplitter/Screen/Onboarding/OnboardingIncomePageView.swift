//
//  OnboardingIncomePageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingIncomePageView: PageView {
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    var pageTag: PageTag = .incomePage
    
    var body: some View {
        VStack {
            Spacer()
            logoView
            Spacer()
            subheadlineView
                .padding()
        }
    }
    
    private var logoView: some View {
        VStack {
            Image(R.image.savings)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding()
            Text(R.string.localizable.onboardingIncomePageTitle)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
    
    private var subheadlineView: some View {
        VStack {
            Text(R.string.localizable.onboardingIncomePageSubheadline)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical)
                .multilineTextAlignment(.center)
            Button {
                withAnimation {
                    onboardingViewModel.selectedPage = .splitterPage
                }
            } label: {
                HStack {
                    Spacer()
                    Text(R.string.localizable.letsGo)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .buttonStyle(BlackButton())
        }
    }
}

struct OnboardingIncomePageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingIncomePageView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .incomePage))
    }
}
