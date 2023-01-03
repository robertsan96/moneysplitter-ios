//
//  OnboardingInitialPageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingInitialPageView: PageView {
    
    @State var shouldAnimate = false
    
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var pageTag: PageTag = .initialPage
    
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
        .onReceive(onboardingViewModel.$selectedPage, perform: { newValue in
            shouldAnimate = pageTag == newValue
        })
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
                .scaleEffect(shouldAnimate ? 1 : 0.5)
                .opacity(shouldAnimate ? 1 : 0.8)
                .animation(.spring(), value: shouldAnimate)
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
                    Spacer()
                }
            }
            .buttonStyle(PrimaryButton())
        }
    }
}

struct OnboardingInitialPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingInitialPageView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .initialPage))
    }
}
