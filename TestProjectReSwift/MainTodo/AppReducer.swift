//
//  TodoReducer.swift
//  TestProjectReSwift
//
//  Created by Wizeline on 18/12/24.
//

import Foundation
import ReSwift
import SwiftUI

public func appReducer(action: Action, appState: AppState? ) -> AppState {
    
    var state = appState ?? AppState(routeState: RouteState(navigationState: .todos))

    if let action = action as? ActionHandler {
        state = action.handle(state: state)
    }
    return state
}

