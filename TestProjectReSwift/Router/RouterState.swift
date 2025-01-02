//
//  RouterState.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 19/12/24.
//

import Foundation

public struct RouteState {
    
    var navigationState: RouteDestionation
    
    init(navigationState: RouteDestionation = .todos) {
        self.navigationState = navigationState
    }
}
