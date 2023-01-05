//
//  NavigationCoordinator.swift
//  MoneySplitter
//
//  Created by Robert Sandru on 04.01.2023.
//

import Foundation
import Combine

protocol NavigationCoordinator: AnyObject {
    
    func registerSubscriptions()
    func disposeSubscriptions()
}

extension NavigationCoordinator {
    
    func registerSubscriptions() { }
    func disposeSubscriptions() { }
}

class BaseNavigationCoordinator<RouteSet: Route>: ObservableObject, NavigationCoordinator {
    
    @Published var activeRoute: RouteSet
    
    weak var parent: NavigationCoordinator?
    var subscriptions: Set<AnyCancellable> = Set()
    
    init(activeRoute: RouteSet) {
        self.activeRoute = activeRoute
        registerSubscriptions()
    }
    
    init(activeRoute: RouteSet, parent: NavigationCoordinator?) {
        self.activeRoute = activeRoute
        self.parent = parent
        
        registerSubscriptions()
    }
    
    deinit {
        disposeSubscriptions()
    }
    
    func registerSubscriptions() { }
}
