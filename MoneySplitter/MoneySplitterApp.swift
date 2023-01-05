//
//  MoneySplitterApp.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI

@main
struct MoneySplitterApp: App {
    let persistenceController = PersistenceController.shared
    
    @State var navigationCoordinator = RootNavigationCoordinator()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(navigationCoordinator)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
