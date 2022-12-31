//
//  BlackButton.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

struct BlackButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? .black.opacity(0.8) : .black)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .clipShape(Capsule())
    }
}

fileprivate struct BlackButtonView: View {
    var body: some View {
        Button {
            // No action
        } label: {
            HStack {
                Text("Next")
                Image(systemName: "arrow.right")
            }
        }
        .buttonStyle(BlackButton())
    }
}

struct BlackButtonView_Previews: PreviewProvider {
    static var previews: some View {
        BlackButtonView()
    }
}
