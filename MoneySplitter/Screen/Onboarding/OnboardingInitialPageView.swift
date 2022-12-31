//
//  OnboardingInitialPageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingInitialPageView: PageView {
    
    @State private var shouldAnimateButtonArrow = false
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var pageTag: PageTag = .initialPage
    
    var body: some View {
        VStack {
            Spacer()
            logoView
            Spacer()
            subheadlineView
                .padding()
        }
        .onAppear {
            shouldAnimateButtonArrow = true
        }
    }
    
    private var logoView: some View {
        VStack {
            Image(R.image.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 75)
            Text(R.string.localizable.appName)
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    private var subheadlineView: some View {
        VStack {
            Text(R.string.localizable.onboardingInitialPageSubheadline)
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
                    Text(R.string.localizable.next)
                        .padding(.horizontal)
                    Image(systemName: "arrow.right")
                        .offset(x: shouldAnimateButtonArrow ? -5 : 0)
                        .animation(
                            .easeInOut(duration: 0.5)
                            .repeatForever(autoreverses: true),
                            value: shouldAnimateButtonArrow)
                    Spacer()
                }
            }
            .buttonStyle(BlackButton())
        }
    }
}

struct OnboardingInitialPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInitialPageView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .initialPage))
    }
}
