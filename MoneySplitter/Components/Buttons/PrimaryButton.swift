//
//  PrimaryButton.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct PrimaryButton: ButtonStyle {
    
    var color: Color = .black
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? color.opacity(0.8) : color)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .clipShape(Capsule())
    }
}

fileprivate struct PrimaryButtonView: View {
    var body: some View {
        Button {
            // No action
        } label: {
            HStack {
                Text("Next")
                Image(systemName: "arrow.right")
            }
        }
        .buttonStyle(PrimaryButton())
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButtonView()
    }
}
