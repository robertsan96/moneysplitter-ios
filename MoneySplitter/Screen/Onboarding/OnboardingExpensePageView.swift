//
//  OnboardingExpensePageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingExpensePageView: PageView {
    @State private var shouldAnimateButtonArrow = false
    @EnvironmentObject var onboardingViewModel: OnboardingViewModel
    
    var pageTag: PageTag = .expensePage
    
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
            Image(R.image.pieChart)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .padding()
            Text(R.string.localizable.onboardingExpensePageTitle)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
    
    private var subheadlineView: some View {
        VStack {
            Text(R.string.localizable.onboardingExpensePageSubheadline)
                .font(.subheadline)
                .fontWeight(.medium)
                .padding(.vertical)
                .multilineTextAlignment(.center)
            Button {
                withAnimation {
                    onboardingViewModel.selectedPage = .incomePage
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

struct OnboardingExpensePageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingExpensePageView()
            .environmentObject(OnboardingViewModel.mock(selectedPage: .expensePage))
    }
}
