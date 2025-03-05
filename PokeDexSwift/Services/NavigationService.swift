//
//  NavigationService.swift
//  PokeDexSwift
//
//  Created by ed on 04/03/25.
//

import SwiftUI
import Combine

protocol NavigationServiceProtocol {
    var navigationPath: NavigationPath { get }
    func push<T: Identifiable>(_ view: T)
    func pop()
}

class NavigationService: NavigationServiceProtocol {
    var navigationPath = NavigationPath()
    
    func push<T: Identifiable>(_ view: T) {
        // Push a view to the navigation stack
        //navigationPath.append(view)
    }
    
    func pop() {
        // Pop the current view from the stack
        navigationPath.removeLast()
    }
}
