//
//  OnboardingIncomePageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingIncomePageView: View {
    
    @State var shouldAnimate = false
    @EnvironmentObject var navigationCoordinator: OnboardingNavigationCoordinator
    
    var route: OnboardingRoute = .income
    
    var body: some View {
        VStack {
            Spacer()
            logoView
                .scaleEffect(shouldAnimate ? 1 : 0.5)
                .opacity(shouldAnimate ? 1 : 0.8)
                .animation(.spring(), value: shouldAnimate)
            Spacer()
            subheadlineView
                .padding()
        }
        .onReceive(navigationCoordinator.$activeRoute, perform: { newValue in
            shouldAnimate = route == newValue
        })
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
                .scaleEffect(shouldAnimate ? 1 : 0.5)
                .opacity(shouldAnimate ? 1 : 0.8)
                .animation(.spring(), value: shouldAnimate)
            Button {
                withAnimation {
                    navigationCoordinator.didFinishOnboarding()
                }
            } label: {
                HStack {
                    Spacer()
                    Text(R.string.localizable.letsGo)
                        .padding(.horizontal)
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButton(color: .accentColor))
        }
    }
}

struct OnboardingIncomePageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingIncomePageView()
            .environmentObject(OnboardingNavigationCoordinator(activeRoute: .income))
    }
}
