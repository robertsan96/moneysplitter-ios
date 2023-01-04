//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation
import Combine

class NavigationCoordinator<RouteSet: Route>: ObservableObject {
    
    @Published var activeRoute: RouteSet
    
    init(activeRoute: RouteSet) {
        self.activeRoute = activeRoute
    }
}
