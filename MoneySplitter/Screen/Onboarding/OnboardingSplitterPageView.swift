//
//  OnboardingSplitterPageView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct OnboardingSplitterPageView: View {
    @Binding var selectedPage: PageTag
    @State private var shouldAnimateButtonArrow = false
    
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
            Button {
                withAnimation {
                    selectedPage = .pipesPage
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

struct OnboardingSplitterPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSplitterPageView(selectedPage: .constant(.splitterPage))
    }
}
