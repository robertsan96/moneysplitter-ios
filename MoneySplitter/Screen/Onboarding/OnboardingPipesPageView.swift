//
//  OnboardingPipesPageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingPipesPageView: View {
    
    @State var shouldAnimate = false
    @EnvironmentObject var navigationCoordinator: OnboardingNavigationCoordinator
    
    var route: OnboardingRoute = .pipe
    
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
            Image(R.image.pipes)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
                .padding()
            Text(R.string.localizable.onboardingPipesPageTitle)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
    
    private var subheadlineView: some View {
        VStack {
            Text(R.string.localizable.onboardingPipesPageSubheadline)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical)
                .multilineTextAlignment(.center)
                .scaleEffect(shouldAnimate ? 1 : 0.5)
                .opacity(shouldAnimate ? 1 : 0.8)
                .animation(.spring(), value: shouldAnimate)
            Button {
                withAnimation {
                    navigationCoordinator.activeRoute = .expense
                }
            } label: {
                HStack {
                    Spacer()
                    Text(R.string.localizable.next)
                        .padding(.horizontal)
                    Image(systemName: "arrow.right")
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButton())
        }
    }
}

struct OnboardingPipesPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPipesPageView()
            .environmentObject(OnboardingNavigationCoordinator(activeRoute: .pipe))
    }
}
