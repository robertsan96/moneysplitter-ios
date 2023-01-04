//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation
import Combine

protocol NavigationCoordinator: AnyObject { }

class BaseNavigationCoordinator<RouteSet: Route>: ObservableObject, NavigationCoordinator {
    
    @Published var activeRoute: RouteSet
    
    weak var parent: NavigationCoordinator?
    
    init(activeRoute: RouteSet) {
        self.activeRoute = activeRoute
    }
    
    init(activeRoute: RouteSet, parent: NavigationCoordinator?) {
        self.activeRoute = activeRoute
        self.parent = parent
    }
}
