//
//  NavigationLogoView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import SwiftUI

struct NavigationLogoView: View {
    var body: some View {
        HStack {
            Image(uiImage: R.image.logo()!)
                .resizable()
                .frame(width: 20, height: 20)
            Text(R.string.localizable.appName())
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct NavigationLogoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationLogoView()
    }
}
