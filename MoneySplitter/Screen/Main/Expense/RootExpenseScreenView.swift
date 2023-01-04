//
//  RootExpenseScreenView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 03.01.2023.
//

import SwiftUI

struct RootExpenseScreenView: View {
    var body: some View {
        NavigationView {
            Text("daq")
        }
    }
}

struct RootExpenseScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RootExpenseScreenView()
        
        MainRootView()
            .environmentObject(MainNavigationCoordinator(activeRoute: .expense))
            .previewDisplayName("Main Navigation Coordinator")
    }
}
