//
//  OnboardingSplitterPageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingSplitterPageView: PageView {
    
    @State var shouldAnimate = false
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var pageTag: PageTag = .splitterPage
    
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
            Image(R.image.vault)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding()
            Text(R.string.localizable.onboardingSplitterPageTitle)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
    
    private var subheadlineView: some View {
        VStack {
            Text(R.string.localizable.onboardingSplitterPageSubheadline)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical)
                .multilineTextAlignment(.center)
                .scaleEffect(shouldAnimate ? 1 : 0.5)
                .opacity(shouldAnimate ? 1 : 0.8)
                .animation(.spring(), value: shouldAnimate)
            Button {
                withAnimation {
                    onboardingViewModel.selectedPage = .pipesPage
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
            .buttonStyle(BlackButton())
        }
    }
}

struct OnboardingSplitterPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSplitterPageView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .splitterPage))
    }
}
