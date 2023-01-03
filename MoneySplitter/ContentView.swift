//
//  ContentView.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 31.12.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var navigationCoordinator: RootNavigationCoordinator
    
    var body: some View {
        switch navigationCoordinator.activeRoute {
        case
                .onboardingInitial,
                .onboardingSplitter,
                .onboardingPipe,
                .onboardingExpense,
                .onboardingIncome:
            OnboardingRootView()
        case
                .generalHome,
                .generalSplitter,
                .generalExpense,
                .generalIncome:
            GeneralRootView()
                .environmentObject(GeneralNavigationCoordinator())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RootNavigationCoordinator())
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
