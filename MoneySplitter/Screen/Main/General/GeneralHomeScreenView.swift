//
//  GeneralHomeScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct GeneralHomeScreenView: View {
    
    @State var isAnimating: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "checkmark.seal.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(isAnimating ? .degrees(360) : .zero)
                    .foregroundColor(.accentColor)
                Text("Welcome to\n**MoneySplitter**")
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }
            .scaleEffect(isAnimating ? 1 : 0)
            .animation(.spring(), value: isAnimating)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLogoView()
                }
            }
            .onAppear {
                isAnimating = true
            }
        }
    }
}

struct GeneralHomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralHomeScreenView()
    }
}
